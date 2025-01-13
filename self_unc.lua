local cloneref = cloneref or function(...): () return ... end
local unc: table = {}

local httpService: service = cloneref(game:GetService('HttpService'))
local inputService: service = cloneref(game:GetService('UserInputService'))

local last_call: number = 0
local function call(konstantType: string, scriptPath: Script | ModuleScript | LocalScript): string
	assert(getscriptbytecode, 'Exploit not supported.')
	local success: boolean, bytecode: string = pcall(getscriptbytecode, scriptPath)
	if (not success) then
		return `-- Failed to get script bytecode, error:\n\n--[[\n{bytecode}\n--]]`
	end
	local time_elapsed: number = os.clock() - last_call
	if time_elapsed <= .5 then
		task.wait(.5 - time_elapsed)
	end
	local httpResult = request({
		Url = 'http://api.plusgiant5.com' .. konstantType,
		Body = bytecode,
		Method = 'POST',
		Headers = {
			['Content-Type'] = 'text/plain'
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
	return call('/konstant/decompile', scriptPath)
end

local function konstant_disassemble(scriptPath: Script | ModuleScript | LocalScript): string
	return call('/konstant/disassemble', scriptPath)
end

unc.require = function(module: ModuleScript): idfk
	if getgenv().require and string.lower(identifyexecutor()):find('solara') or not getgenv().require then
		if module:IsA('ModuleScript') then
			local suc: boolean, res: string = pcall(function()
				return decompile and decompile(module) or konstant_decompile(module)
			end)
			if suc then
				return loadstring(res)()
			elseif not suc and not decompile then
				error('Konstant decompiler downed ig')
			else
				error(res)
			end
		end
		elseif module:IsA('LocalScript') or module:IsA('Script') then
			error('Attempted to call require with invalid argument(s).')
		end
	end
	return require(module)
end

unc.loadfile = function(file: path): ()
	if not loadfile then
		local suc: boolean, res: string = pcall(function()
			return readfile(file)
		end)
		if suc then return loadstring(res) end
	end
	return loadfile(file)
end

unc.isfile = function(file: path): boolean
	if not isfile then
		local suc: boolean, res: string = pcall(function()
			return readfile(file)
		end)
		return suc
	end
	return isfile(file)
end

unc.request = function(args: table): table
	if not request then
		if args['Method'] == 'GET' then
			return {
				Body = game:HttpGet(args['Url']),
				Headers = {
					[identifyexecutor()..'-Fingerprint'] = httpService:GenerateGUID(true)
				},
				StatusCode = 200
			}
		end
		return {
			Body = 'Failed',
			Headers = {
				[identifyexecutor()..'-Fingerprint'] = httpService:GenerateGUID(true)
			},
			StatusCode = 404
		}
	end
	return request(args)
end

unc.getcustomasset = function(bruh: path): string
	if not getcustomasset and not inputService.TouchEnabled then
		local success: boolean, response: string = pcall(function()
			if unc.isfile(bruh) then
				return 'rbxasset://'..bruh
			end
		end)
		if success then return response end
	end
	return getcustomasset(bruh)
end

if not getgenv().shared then getgenv().shared = {} end

print('[Self-UNC]: require can\'t write, it\'s readonly.')
print('[Self-UNC]: request only support for method \'GET\'.')

return unc