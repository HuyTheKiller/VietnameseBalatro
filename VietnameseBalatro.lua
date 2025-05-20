VNBalatro = SMODS.current_mod

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