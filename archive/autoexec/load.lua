-- // Birthday Notifier
repeat task.wait() until game:IsLoaded()

local birthday = {List = {}}

local cloneref = cloneref or function(reference) return reference end

local writefile = writefile or function(file, src) end
local readfile = readfile or function(file) end
local getcustomasset = getcustomasset or function(asset)
	return 'rbxasset://'..asset
end
local loadfile = loadfile or function(file)
	return loadstring(readfile(file), true)
end

if not isfile('birthdaylist.json') then
	writefile('birthdaylist.json', '[]')
end

local lplr = cloneref(game:GetService('Players')).LocalPlayer
local startergui = cloneref(game:GetService('StarterGui'))
local httpService = cloneref(game:GetService('HttpService'))
local soundService = cloneref(game:GetService('SoundService'))

if isfile('birthdaylist.json') and readfile('birthdaylist.json') ~= '[]' then
	birthday.List = httpService:JSONDecode(readfile('birthdaylist.json'))
end

function birthday:addList(name, date)
	table.insert(self.List, {
		Name = name,
		Date = date
	})
end

function birthday:removeList(name)
	for i,v in self.List do
		if v.Name == name then
			table.remove(self.List, i)
		end
	end
end

function birthday:showList()
	print('\n\n			[=============== BIRTHDAY LIST ===============]')
	for i,v in self.List do
		if type(v) == 'table' then
			for _, data in v do
				print(`{_}: {data}`)
			end
		end
	end
end

function birthday:Save()
	writefile('birthdaylist.json', httpService:JSONEncode(self.List))
end

for i,v in birthday.List do
	if os.date('%m %d') == v.Date then
		startergui:SetCore('SendNotification', {
			Title = 'Birthday Notifier',
			Text = 'Today, it\'s '..v.Name..'\'s Birthday!',
			Duration = 60
		})
	end
end

-- // Infinite Yield

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()

-- // Decompiler

if not decompile then
	assert(getscriptbytecode, 'Exploit not supported.')

	local last_call = 0
	local function call(konstantType, scriptPath)
		local success, bytecode = pcall(getscriptbytecode, scriptPath)
		if (not success) then
			return `-- Failed to get script bytecode, error:\n\n--[[\n{bytecode}\n--]]`
		end
		local time_elapsed = os.clock() - last_call
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

	getgenv().decompile = function(scriptPath)
		return call('/konstant/decompile', scriptPath)
	end
	getgenv().disassemble = function(scriptPath) 
		return call('/konstant/disassemble', scriptPath)
	end
end