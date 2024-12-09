local unc = {}
assert(getscriptbytecode, "Exploit not supported.")
local API: string = "http://api.plusgiant5.com"
local last_call = 0
local function call(konstantType: string, scriptPath: Script | ModuleScript | LocalScript): string
	local success: boolean, bytecode: string = pcall(getscriptbytecode, scriptPath)
	if (not success) then
		return `-- Failed to get script bytecode, error:\n\n--[[\n{bytecode}\n--]]`
	end
	local time_elapsed = os.clock() - last_call
	if time_elapsed <= .5 then
		task.wait(.5 - time_elapsed)
	end
	local httpResult = request({
		Url = API .. konstantType,
		Body = bytecode,
		Method = "POST",
		Headers = {
			["Content-Type"] = "text/plain"
		},
	})
	last_call = os.clock()
	if (httpResult.StatusCode ~= 200) then
		return `-- Error occured while requesting the API, error:\n\n--[[\n{httpResult.Body}\n--]]`
	else
		return httpResult.Body
	end
end

local function konstant_decompile(scriptPath: Script | ModuleScript | LocalScript): string
	return call("/konstant/decompile", scriptPath)
end

local function konstant_disassemble(scriptPath: Script | ModuleScript | LocalScript): string
	return call("/konstant/disassemble", scriptPath)
end

unc.require = require and not string.lower(identifyexecutor()):find('solara') or function(module)
	if module:IsA('ModuleScript') then
		local source = konstant_decompile(module)
		return loadstring(source)()
	elseif module:IsA('LocalScript') or module:IsA('Script') then
		warn('[Self-UNC]: attempt to require a localscript or script, Require support only ModuleScript.')
	end
end

return unc