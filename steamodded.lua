SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
})

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

SMODS.current_mod.description_loc_vars = function()
	return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

SMODS.current_mod.config_tab = VNBalatro.config_tab