VNBalatro = SMODS.current_mod
VNBalatro.utf8 = require "utf8"
VNBalatro.post_buffer = false
VNBalatro.awaiting_dead_key = false
VNBalatro.max_accented = "ắằẳẵặấầẩẫậếềểễệíìỉĩịốồổỗộớờởỡợứừửữựýỳỷỹỵđẮẰẲẴẶẤẦẨẪẬẾỀỂỄỆÍÌỈĨỊỐỒỔỖỘỚỜỞỠỢỨỪỬỮỰÝỲỶỸỴĐ"
VNBalatro.accented_table = {
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
}
VNBalatro.conversion = {
	a = "a", a1 = "á", a2 = "à", a3 = "ả", a4 = "ã", a5 = "ạ", a6 = "â", a8 = "ă",
	A = "A", A1 = "Á", A2 = "À", A3 = "Ả", A4 = "Ã", A5 = "Ạ", A6 = "Â", A8 = "Ă",
	e = "e", e1 = "é", e2 = "è", e3 = "ẻ", e4 = "ẽ", e5 = "ẹ", e6 = "ê", i = "i",
	E = "E", E1 = "É", E2 = "È", E3 = "Ẻ", E4 = "Ẽ", E5 = "Ẹ", E6 = "Ê", I = "I",
	o = "o", o1 = "ó", o2 = "ò", o3 = "ỏ", o4 = "õ", o5 = "ọ", o6 = "ô", o7 = "ơ",
	O = "o", O1 = "Ó", O2 = "Ò", O3 = "Ỏ", O4 = "Õ", O5 = "Ọ", O6 = "Ô", O7 = "Ơ",
	u = "u", u1 = "ú", u2 = "ù", u3 = "ủ", u4 = "ũ", u5 = "ụ", u7 = "ư", d = "d", y = "y",
	U = "U", U1 = "Ú", U2 = "Ù", U3 = "Ủ", U4 = "Ũ", U5 = "Ụ", U7 = "Ư", D = "Đ", Y = "Y",
}

---@param raw_key string
function RAW_TO_UNICODE(raw_key)
	local key = VNBalatro.conversion[raw_key]
	if key then return key end
	return ''
end

---Create an array of utf8 character codepoints
---@param utf8_string string
function U_CODEPOINT_ARR(utf8_string)
	local t = {}
	for _, c in VNBalatro.utf8.codes(utf8_string, true) do
		t[#t+1] = c
	end
	return t
end

---@param text string
function string.isup(text)
	if text == '' or text == ' ' then return false end
	return text == string.upper(text)
end

-- This hook is for debug purposes
local tik = G.FUNCS.text_input_key
G.FUNCS.text_input_key = function(args)
	tik(args)
	if VNBalatro.config.input_method ~= 3 and G.CONTROLLER.text_input_hook then
		print(G.CONTROLLER.text_input_hook.config.ref_table.text.letters)
		print("current position:", G.CONTROLLER.text_input_hook.config.ref_table.text.current_position)
	end
end

SMODS.Language({
	key = "vi",
	label = "Tiếng Việt",
	font = {
		file = "m6x11plus.ttf",
		render_scale = G.TILESIZE*10,
		TEXT_HEIGHT_SCALE = 0.83,
		TEXT_OFFSET = {x=10,y=-20},
		FONTSCALE = 0.1,
		squish = 1,
		DESCSCALE = 1,
	},
	beta = true,
	button = "Phản Hồi Ngôn Ngữ (vô dụng)",
	warning = {"Đây là bản dịch cá nhân và được chèn vào game thông qua Steamodded (smods).", "Nếu có thắc mắc, vui lòng liên hệ chủ bản dịch", "dưới tên theambushingbush trong máy chủ Balatro chính thức."},
	path = "vi.lua",
})

local data = NFS.newFileData(VNBalatro.path .. 'assets/fonts/m6x11plus.ttf')
love.graphics.setNewFont(data, G.TILESIZE)
G.FONTS[1].FONT = love.graphics.newFont(data, G.FONTS[1].render_scale)

SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32
})

VNBalatro.description_loc_vars = function()
	return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

VNBalatro.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 4}, nodes = {
        {n=G.UIT.R, config = {align = 'cm'}, nodes={
			create_option_cycle({label = localize('vn_input_method'), current_option = VNBalatro.config.input_method, options = localize('vn_input_method_options'), ref_table = VNBalatro.config, ref_value = 'input_method', colour = G.C.RED, w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6), text_scale=0.5*0.65/(5/6), scale=5/6, no_pips = true, opt_callback = 'cycle_update'}),
		}},
    }}
end