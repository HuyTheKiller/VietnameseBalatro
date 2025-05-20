VNBalatro = SMODS.current_mod
VNBalatro.utf8 = require "utf8"
VNBalatro.awaiting_dead_key = false
VNBalatro.max_accented = "ắằẳẵặấầẩẫậếềểễệíìỉĩịốồổỗộớờởỡợứừửữựýỳỷỹỵđ"
VNBalatro.accented_table = {
	base = "aeioudy",
	primary = {
		a  = {"ăâ", "86", "wa"}, e  = {"ê", "6", "e"}, o  = {"ôơ", "67", "ow"}, u  = {"ư", "7", "w"},
		a1 = {"ắấ", "86", "wa"}, e1 = {"ế", "6", "e"}, o1 = {"ốớ", "67", "ow"}, u1 = {"ứ", "7", "w"},
		a2 = {"ằầ", "86", "wa"}, e2 = {"ề", "6", "e"}, o2 = {"ồờ", "67", "ow"}, u2 = {"ừ", "7", "w"},
		a3 = {"ẳẩ", "86", "wa"}, e3 = {"ể", "6", "e"}, o3 = {"ổở", "67", "ow"}, u3 = {"ử", "7", "w"},
		a4 = {"ẵẫ", "86", "wa"}, e4 = {"ễ", "6", "e"}, o4 = {"ỗỡ", "67", "ow"}, u4 = {"ữ", "7", "w"},
		a5 = {"ặậ", "86", "wa"}, e5 = {"ệ", "6", "e"}, o5 = {"ộợ", "67", "ow"}, u5 = {"ự", "7", "w"},
		d =  {"đ" , "9" , "d" },
	},
	secondary = {
		a  = {"áàảãạ", "12345", "sfrxj"}, e  = {"éèẻẽẹ", "12345", "sfrxj"},
		a8 = {"ắằẳẵặ", "12345", "sfrxj"}, e6 = {"ếềểễệ", "12345", "sfrxj"},
		a6 = {"ấầẩẫậ", "12345", "sfrxj"}, i  = {"íìỉĩị", "12345", "sfrxj"},
		o  = {"óòỏõọ", "12345", "sfrxj"}, u  = {"úùủũụ", "12345", "sfrxj"},
		o6 = {"ốồổỗộ", "12345", "sfrxj"}, u7 = {"ứừửữự", "12345", "sfrxj"},
		o7 = {"ớờởỡợ", "12345", "sfrxj"}, y  = {"ýỳỷỹỵ", "12345", "sfrxj"},
	},
}
VNBalatro.conversion = {
	a = "a", a1 = "á", a2 = "à", a3 = "ả", a4 = "ã", a5 = "ạ", a6 = "â", a8 = "ă",
	e = "e", e1 = "é", e2 = "è", e3 = "ẻ", e4 = "ẽ", e5 = "ẹ", e6 = "ê",
	i = "i",
	o = "o", o1 = "ó", o2 = "ò", o3 = "ỏ", o4 = "õ", o5 = "ọ", o6 = "ô", o7 = "ơ",
	u = "u", u1 = "ú", u2 = "ù", u3 = "ủ", u4 = "ũ", u5 = "ụ", u7 = "ư",
	d = "d",
	y = "y",
}

---@param raw_key string
function RAW_TO_UNICODE(raw_key)
	local key = VNBalatro.conversion[raw_key]
	if key then return key end
	return ''
end

---Create an array of utf8 character positions
---@param utf8_string string
function U_INDEX_ARR(utf8_string)
	local t = {}
	for p, _ in VNBalatro.utf8.codes(utf8_string) do
		t[#t+1] = p
	end
	-- Append the final element as the "closing gate"
	t[#t+1] = VNBalatro.utf8.offset(utf8_string, -1)+1
	return t
end

---@param text string
function string.isup(text)
	if text == '' or text == ' ' then return false end
	return text == string.upper(text)
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