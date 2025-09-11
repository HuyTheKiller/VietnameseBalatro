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