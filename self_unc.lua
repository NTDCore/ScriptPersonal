local cloneref = cloneref or function(...) return ... end

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

unc.require = function(module)
	if getgenv().require and string.lower(identifyexecutor()):find('solara') or not getgenv().require then
		if module:IsA('ModuleScript') then
			local source = decompile and decompile(module) or konstant_decompile(module)
			return loadstring(source)()
		elseif module:IsA('LocalScript') or module:IsA('Script') then
			error('Attempted to call require with invalid argument(s).')
		end
	else
		return require(module)
	end
end

unc.loadfile = function(file)
	if not loadfile then
		local suc, res = pcall(function()
			return readfile(file)
		end)
		if suc then return loadstring(res) end
	else
		return loadfile(file)
	end
end

unc.isfile = function(file)
	if not isfile then
		local suc, res = pcall(function()
			return readfile(file)
		end)
		return suc
	else
		return isfile(file)
	end
end

unc.request = function(args)
	if not request then
		if args['Method'] == 'GET' then
			return {
				Body = game:HttpGet(args['Url']),
				Headers = {},
				StatusCode = 200
			}
		end
		return {
			Body = 'Failed',
			Headers = {},
			StatusCode = 404
		}
	else
		return request(args)
	end
end

print('[Self-UNC]: '..[[require can't write, it's readonly.]])
print('[Self-UNC]: '..[[request only support for method "GET".]])

return unc