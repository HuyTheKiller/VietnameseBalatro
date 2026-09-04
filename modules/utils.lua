-- Config tab
VNBalatro.config_tab = function()
	return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.CLEAR}, nodes = {
		{n=G.UIT.R, config = {align = 'cm'}, nodes={
			create_option_cycle({label = localize('vn_input_method'), current_option = VNBalatro.config.input_method, options = localize('vn_input_method_options'), ref_table = VNBalatro.config, ref_value = 'input_method', colour = G.C.RED, w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6), text_scale=0.5*0.65/(5/6), scale=5/6, no_pips = true, opt_callback = 'update_input_method', on_demand_tooltip = {text = localize("vn_input_warning")}}),
		}},
	}}
end

G.FUNCS.update_input_method = function(e)
	VNBalatro.config.input_method = e.to_key
	VNBalatro.save_config()
end

-- helper functions for Vietnamese text input
local tik = G.FUNCS.text_input_key
G.FUNCS.text_input_key = function(args)
	tik(args)
	if VNBalatro.config.input_method ~= 3 and VNBalatro.debug and G.CONTROLLER.text_input_hook then
		print(G.CONTROLLER.text_input_hook.config.ref_table.text.letters)
		print("current position:", G.CONTROLLER.text_input_hook.config.ref_table.text.current_position)
	end
end

function VN_utf8.char_at(text, i)
	if not text or not i then
		return nil
	end
	local start = VN_utf8.offset(text, i)
	if not start then
		return nil
	end

	local next_pos = VN_utf8.offset(text, i + 1)
	return text:sub(start, next_pos and next_pos - 1 or -1)
end

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

--Handle localzation without SMODS
function VNBalatro.table_merge(target, source, ...)
	assert(type(target) == "table", "Target is not a table")
	local tables_to_merge = { source, ... }
	if #tables_to_merge == 0 then
		return target
	end

	for k, t in ipairs(tables_to_merge) do
		assert(type(t) == "table", string.format("Expected a table as parameter %d", k))
	end

	for i = 1, #tables_to_merge do
		local from = tables_to_merge[i]
		for k, v in pairs(from) do
			if type(v) == "table" then
				target[k] = target[k] or {}
				target[k] = VNBalatro.table_merge(target[k], v)
			else
				target[k] = v
			end
		end
	end

	return target
end

-- Handle loading and saving config
function VNBalatro.save_config()
	local function str_pack(data, recursive)
		local ret_str = (recursive and "" or "return ").."{"
		for k, v in pairs(data or {}) do
			local tk, tv = type(k), type(v)
			assert((tk ~= "table"), "Data table cannot have an table as a key reference")
			if tk == "string" then k = '['..string.format("%q", k)..']'
			else k = "["..k.."]" end
			if tv == "table" then v = str_pack(v, true)
			elseif tv == "string" then v = string.format("%q", v)
			elseif tv == "boolean" then v = v and "true" or "false" end
			ret_str = ret_str..k.."="..v..","
		end
		return ret_str.."}"
	end
	local success = pcall(function()
		VNBalatro.nativefs.createDirectory("config")
		assert(VNBalatro.config and next(VNBalatro.config))
		VNBalatro.nativefs.write("config/VNBalatro.jkr", str_pack(VNBalatro.config))
	end)
	return success
end

function VNBalatro.load_config()
	local success, config = pcall(function()
		return setfenv(load(VNBalatro.nativefs.read("config/VNBalatro.jkr")), {})()
	end)
	if not success or type(config) ~= "table" then config = {} end
	VNBalatro.config = VNBalatro.default_config()
	local function insert_saved_config(saved, default)
		for sk, sv in pairs(saved) do
			local sv_type, dv_type = type(sv), type(default[sk])
			if not default[sk] then
				default[sk] = sv
			elseif sv_type ~= dv_type then
			elseif sv_type == "table" and dv_type == "table" then
				insert_saved_config(sv, default[sk])
			elseif sv ~= default[sk] then
				default[sk] = sv
			end
		end
	end
	insert_saved_config(config, VNBalatro.config)
	return VNBalatro.config
end

function VNBalatro.default_config()
	return {input_method = 3}
end

if not VNBalatro.config then VNBalatro.load_config() end