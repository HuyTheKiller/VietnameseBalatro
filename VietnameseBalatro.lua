require("VNBalatro/core")
require("VNBalatro/utils")
VNBalatro:init()

local vn_init_localization = init_localization
function init_localization()
	if not SMODS then
		local en_loc = require("VNBalatro/localization/en-us")
		VNBalatro.table_merge(G.localization, en_loc)
		if G.SETTINGS.language == "vi" then
			G.localization = require("VNBalatro/localization/vi")
		elseif G.SETTINGS.language ~= "en-us" then
			local success, current_loc = pcall(function()
				return require("VNBalatro/localization/" .. G.SETTINGS.language)
			end)
			if success and current_loc then
				VNBalatro.table_merge(G.localization, current_loc)
			end
		end
		VNBalatro.vi_injected = true
	end
	return vn_init_localization()
end

local vn_set_language = Game.set_language
function Game:set_language()
	G.localization = G.localization or {}
	vn_set_language(self)
	if not VNBalatro.m6x11plus_injected then
		local data = VNBalatro.nativefs.newFileData(VNBalatro.path .. '/assets/fonts/m6x11plus.ttf')
		love.graphics.setNewFont(data, G.TILESIZE)
		G.FONTS[1].FONT = love.graphics.newFont(data, G.FONTS[1].render_scale)
		VNBalatro.m6x11plus_injected = true
	end
	if G.SETTINGS.language == "vi" then
		VNBalatro.prompted = true
		if not SMODS then
			init_localization()
		end
	end
end

local vn_main_menu = Game.main_menu
function Game:main_menu(change_context)
    vn_main_menu(self, change_context)
    if not SMODS then
		local version = VNBalatro.name.." v"..VNBalatro.version.." "..localize("vn_by").." HuyTheKiller"
		UIBox{
			definition =
			{n=G.UIT.ROOT, config={align = "cm", colour = G.C.UI.TRANSPARENT_DARK}, nodes={
				{n=G.UIT.T, config={text = version, scale = 0.3, colour = G.C.UI.TEXT_LIGHT}}
			}},
			config = {align="tri", offset = {x=0,y=0.3}, major = G.ROOM_ATTACH, bond = 'Weak'}
		}
	end
end

local vn_main_menu_buttons = create_UIBox_main_menu_buttons
function create_UIBox_main_menu_buttons()
	local ret = vn_main_menu_buttons()
	if not SMODS and not G.F_ENGLISH_ONLY and G.SETTINGS.language ~= "vi" and not VNBalatro.prompted then
		local text = "Chọn tiếng Việt ở đây!"
		local instruction_node = {n=G.UIT.R, config = {align = "cm", colour = G.C.CLEAR}, nodes={
			{n=G.UIT.T, config={text = text, scale = 0.25, colour = G.C.UI.TEXT_LIGHT}},
        }}
		table.insert(ret.nodes[2].nodes, 3, instruction_node)
	end
	return ret
end

local vn_hud = create_UIBox_HUD
function create_UIBox_HUD()
	local ret = vn_hud()
	if G.SETTINGS.language == "vi" then
		for _, node in ipairs(ret.nodes[1].nodes[1].nodes) do
			if node.config.id == "row_dollars_chips" then
				local child_node = node.nodes[1].nodes[1].nodes
				child_node[1].nodes[1].config.text = localize('k_lower_score')
				child_node[2].nodes[1].config.text = localize('k_round')
				break
			end
		end
	end
	return ret
end