--- STEAMODDED HEADER
--- MOD_NAME: Vietnamese Balatro
--- MOD_ID: VNBalatro
--- MOD_AUTHOR: [HuyTheKiller]
--- MOD_DESCRIPTION: Adds Vietnamese translation to Balatro while using a modified version of m6x11plus. Thêm tiếng Việt vào Balatro trong khi dùng một phiên bản đã chỉnh sửa của m6x11plus.

----------------------------------------------
------------MOD CODE -------------------------
SMODS.Language({
	key = "vi",
	label = "Tiếng Việt",
	font = {
		file = SMODS.current_mod.path.."fonts/m6x11plus.ttf",
		render_scale = G.TILESIZE*10,
		TEXT_HEIGHT_SCALE = 0.83,
		TEXT_OFFSET = {x=10,y=-20},
		FONTSCALE = 0.1,
		squish = 1,
		DESCSCALE = 1,
		FONT = love.graphics.newFont(SMODS.current_mod.path.."fonts/m6x11plus.ttf", G.TILESIZE*10)
	},
	beta = true,
	button = "Phản Hồi Ngôn Ngữ (vô dụng)",
	warning = {"Đây là bản dịch cá nhân và được chèn vào game thông qua Steamodded.", "Nếu có thắc mắc, vui lòng liên hệ chủ bản dịch", "dưới tên theambushingbush trong máy chủ Balatro chính thức."},
	path = "vi.lua",
})
if SMODS.Atlas then
	SMODS.Atlas({
	  key = "modicon",
	  path = "icon.png",
	  px = 32,
	  py = 32
	})
  end
----------------------------------------------
------------MOD CODE END----------------------
