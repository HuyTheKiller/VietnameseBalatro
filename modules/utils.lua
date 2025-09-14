-- Config tab
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

-- helper functions for Vietnamese text input
local tik = G.FUNCS.text_input_key
G.FUNCS.text_input_key = function(args)
	tik(args)
	if VNBalatro.config.input_method ~= 3 and VNBalatro.debug and G.CONTROLLER.text_input_hook then
		print(G.CONTROLLER.text_input_hook.config.ref_table.text.letters)
		print("current position:", G.CONTROLLER.text_input_hook.config.ref_table.text.current_position)
	end
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
    local serialized = "return { input_method = "..tostring(VNBalatro.config.input_method).." }"
    love.filesystem.write("config/VNBalatro.lua", serialized)
end

function VNBalatro.load_config()
    if love.filesystem.exists("config/VNBalatro.lua") then
        local str = ""
        for line in love.filesystem.lines("config/VNBalatro.lua") do
            str = str..line
        end
        return loadstring(str)()
    else
        return {
            input_method = 3,
        }
    end
end

if not VNBalatro.config then VNBalatro.config = VNBalatro.load_config() end