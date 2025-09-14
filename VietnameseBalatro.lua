VN_utf8 = require "utf8"

require("VNBalatro/core")
require("VNBalatro/utils")
VNBalatro:init()

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
	for _, c in VN_utf8.codes(utf8_string, true) do
		t[#t+1] = c
	end
	return t
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

local vn_init_localization = init_localization
function init_localization()
	if not VNBalatro.vi_injected and not SMODS then
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
	if G.SETTINGS.language == "vi" and not SMODS then
		VNBalatro.vi_injected = nil
		init_localization()
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
	if not SMODS and not G.F_ENGLISH_ONLY and G.SETTINGS.language ~= "vi" then
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

VNBalatro.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.CLEAR}, nodes = {
        {n=G.UIT.R, config = {align = 'cm'}, nodes={
			create_option_cycle({label = localize('vn_input_method'), current_option = VNBalatro.config.input_method, options = localize('vn_input_method_options'), ref_table = VNBalatro.config, ref_value = 'input_method', colour = G.C.RED, w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6), text_scale=0.5*0.65/(5/6), scale=5/6, no_pips = true, opt_callback = 'update_input_method'}),
		}},
    }}
end

G.FUNCS.update_input_method = function(e)
	VNBalatro.config.input_method = e.to_key
    VNBalatro.save_config()
end