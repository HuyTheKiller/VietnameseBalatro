VNBalatro = {
	json = require "json",
	lovely = require "lovely",
	nativefs = require "nativefs",
	name = "VietnameseBalatro",
	version = "",
	parse_path = function(self)
		local info = self.nativefs.getDirectoryItemsInfo(self.lovely.mod_dir)
		local path = ""
		for i, v in pairs(info) do
			if v.type == "directory"
			and self.nativefs.getInfo(self.lovely.mod_dir .. "/" .. v.name .. "/VietnameseBalatro.lua") then
				path = self.lovely.mod_dir .. "/" .. v.name
			end
		end
		if not self.nativefs.getInfo(path) then
			error('Khong the tim thay thu muc VietnameseBalatro.\nHay kiem tra xem da cai dat dung cach chua va thu muc co bi long vao nhau khong.')
		end
		self.path = path
	end,
	parse_version = function(self, directory)
        if self.version == "" then
            for _, filename in ipairs(self.nativefs.getDirectoryItems(directory)) do
                local file_path = directory .. "/" .. filename
                local file_type = self.nativefs.getInfo(file_path).type
                if file_type == 'directory' or file_type == 'symlink' then
                elseif filename:lower():match('%.json') then
                    local json_str = self.nativefs.read(file_path)
                    local parsed, mod = pcall(self.json.decode, json_str)
                    if parsed and mod.version then
                        self.version = mod.version
                    end
                end
            end
        end
	end,
	status = function(self)
		if self.initialized then
			return {
				name = self.name,
				version = self.version,
				["Vietnamese injected"] = self.vi_injected or false,
				["m6x11plus injected"] = self.m6x11plus_injected or false,
			}
        else
            return "Error: not initialized"
		end
	end,
    init = function(self)
		if not self.initialized then
			self:parse_path()
			self:parse_version(self.path)
			self.initialized = true
		end
	end,
	post_buffer = false,
	awaiting_dead_key = false,
	max_accented = "ắằẳẵặấầẩẫậếềểễệíìỉĩịốồổỗộớờởỡợứừửữựýỳỷỹỵđẮẰẲẴẶẤẦẨẪẬẾỀỂỄỆÍÌỈĨỊỐỒỔỖỘỚỜỞỠỢỨỪỬỮỰÝỲỶỸỴĐ",
	accented_table = {
		base = "aeioudyAEIOUDY",
		primary = {
			a  = {"ăâ", "86", "wa"}, e  = {"ê", "6", "e"}, o  = {"ôơ", "67", "ow"}, u  = {"ư", "7", "w"},
			a1 = {"ắấ", "86", "wa"}, e1 = {"ế", "6", "e"}, o1 = {"ốớ", "67", "ow"}, u1 = {"ứ", "7", "w"},
			a2 = {"ằầ", "86", "wa"}, e2 = {"ề", "6", "e"}, o2 = {"ồờ", "67", "ow"}, u2 = {"ừ", "7", "w"},
			a3 = {"ẳẩ", "86", "wa"}, e3 = {"ể", "6", "e"}, o3 = {"ổở", "67", "ow"}, u3 = {"ử", "7", "w"},
			a4 = {"ẵẫ", "86", "wa"}, e4 = {"ễ", "6", "e"}, o4 = {"ỗỡ", "67", "ow"}, u4 = {"ữ", "7", "w"},
			a5 = {"ặậ", "86", "wa"}, e5 = {"ệ", "6", "e"}, o5 = {"ộợ", "67", "ow"}, u5 = {"ự", "7", "w"},
			A  = {"ĂÂ", "86", "wa"}, E  = {"Ê", "6", "e"}, O  = {"ÔƠ", "67", "ow"}, U  = {"Ư", "7", "w"},
			A1 = {"ẮẤ", "86", "wa"}, E1 = {"Ế", "6", "e"}, O1 = {"ỐỚ", "67", "ow"}, U1 = {"Ứ", "7", "w"},
			A2 = {"ẰẦ", "86", "wa"}, E2 = {"Ề", "6", "e"}, O2 = {"ỒỜ", "67", "ow"}, U2 = {"Ừ", "7", "w"},
			A3 = {"ẲẨ", "86", "wa"}, E3 = {"Ể", "6", "e"}, O3 = {"ỔỞ", "67", "ow"}, U3 = {"Ữ", "7", "w"},
			A4 = {"ẴẪ", "86", "wa"}, E4 = {"Ễ", "6", "e"}, O4 = {"ỖỠ", "67", "ow"}, U4 = {"Ữ", "7", "w"},
			A5 = {"ẶẬ", "86", "wa"}, E5 = {"Ệ", "6", "e"}, O5 = {"ỘỢ", "67", "ow"}, U5 = {"Ự", "7", "w"},
			d =  {"đ" , "9" , "d" }, D =  {"Đ", "9", "d"},
		},
		secondary = {
			a  = {"áàảãạ", "12345", "sfrxj"}, e  = {"éèẻẽẹ", "12345", "sfrxj"},
			a8 = {"ắằẳẵặ", "12345", "sfrxj"}, e6 = {"ếềểễệ", "12345", "sfrxj"},
			a6 = {"ấầẩẫậ", "12345", "sfrxj"}, i  = {"íìỉĩị", "12345", "sfrxj"},
			o  = {"óòỏõọ", "12345", "sfrxj"}, u  = {"úùủũụ", "12345", "sfrxj"},
			o6 = {"ốồổỗộ", "12345", "sfrxj"}, u7 = {"ứừửữự", "12345", "sfrxj"},
			o7 = {"ớờởỡợ", "12345", "sfrxj"}, y  = {"ýỳỷỹỵ", "12345", "sfrxj"},
			A  = {"ÁÀẢÃẠ", "12345", "sfrxj"}, E  = {"ÉÈẺẼẸ", "12345", "sfrxj"},
			A8 = {"ẮẰẲẴẶ", "12345", "sfrxj"}, E6 = {"ẾỀỂỄỆ", "12345", "sfrxj"},
			A6 = {"ẤẦẨẪẬ", "12345", "sfrxj"}, I  = {"ÍÌỈĨỊ", "12345", "sfrxj"},
			O  = {"ÓÒỎÕỌ", "12345", "sfrxj"}, U  = {"ÚÙỦŨỤ", "12345", "sfrxj"},
			O6 = {"ỐỒỔỖỘ", "12345", "sfrxj"}, U7 = {"ỨỪỬỮỰ", "12345", "sfrxj"},
			O7 = {"ỚỜỞỠỢ", "12345", "sfrxj"}, Y  = {"ÝỲỶỸỴ", "12345", "sfrxj"},
		},
	},
	conversion = {
		a = "a", a1 = "á", a2 = "à", a3 = "ả", a4 = "ã", a5 = "ạ", a6 = "â", a8 = "ă",
		A = "A", A1 = "Á", A2 = "À", A3 = "Ả", A4 = "Ã", A5 = "Ạ", A6 = "Â", A8 = "Ă",
		e = "e", e1 = "é", e2 = "è", e3 = "ẻ", e4 = "ẽ", e5 = "ẹ", e6 = "ê", i = "i",
		E = "E", E1 = "É", E2 = "È", E3 = "Ẻ", E4 = "Ẽ", E5 = "Ẹ", E6 = "Ê", I = "I",
		o = "o", o1 = "ó", o2 = "ò", o3 = "ỏ", o4 = "õ", o5 = "ọ", o6 = "ô", o7 = "ơ",
		O = "o", O1 = "Ó", O2 = "Ò", O3 = "Ỏ", O4 = "Õ", O5 = "Ọ", O6 = "Ô", O7 = "Ơ",
		u = "u", u1 = "ú", u2 = "ù", u3 = "ủ", u4 = "ũ", u5 = "ụ", u7 = "ư", d = "d", y = "y",
		U = "U", U1 = "Ú", U2 = "Ù", U3 = "Ủ", U4 = "Ũ", U5 = "Ụ", U7 = "Ư", D = "Đ", Y = "Y",
	},
}