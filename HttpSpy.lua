-- Made By Monia Since 2/3/24
-- HttpSpy Powered By NSL

-- // Instance \\ --

print('HttpSpy Loaded!')
if not shared.HttpSpy then
	shared.HttpSpy = {}
end
local HttpSpySettings = {
	['Notifications'] = shared.HttpSpy.Notifications or false,
	['AntiHttpGet'] = shared.HttpSpy.AntiHttpGet or false,
	['AntiWebSocket'] = shared.HttpSpy.AntiWebSocket or false,
	['AntiRequest'] = shared.HttpSpy.AntiRequest or true,
	['AntiKick'] = shared.HttpSpy.AntiKick or true,
	['AntiFPS'] = shared.HttpSpy.AntiFPS or false
}
local httpSpyDetected = {
	urls = {
		'github',
		'pastebin',
		'ip-api'
	},
	malicious = {
		'grabify',
		'discord',
		'webhook',
		'ip-api'
	}
}

local cloneref = cloneref or function(ref) return ref end
local websockets = WebSocket and WebSocket.Connect or WebSocket and WebSocket.connect
local hookfunctions = hookfunc or hookfunction -- hookfunc in krampus lol
local requests = Fluxus and Fluxus.request or fluxus and fluxus.request or http_request or http.request or request
local lplr = cloneref(game:GetService('Players')).LocalPlayer -- my friend be doin' e-sex in discord
local startergui = cloneref(game:GetService('StarterGui'))
local sendNotification = function(name, info, delay)
	startergui:SetCore('SendNotification', {
		Title = name or 'Roblox',
		Text = info or 'sigma sigma boy',
		Duration = delay or 5
	})
end
if not isfolder('httpSpy') then
	makefolder('httpSpy')
end
local writeDirectFile = function(file, code)
	return writefile('httpSpy/'..file, code)
end
local detectLink = function(file, logname, code)
	if (not isfile('httpSpy/'..file)) then
		writeDirectFile(file, '-- '..logname..' Log\n--HttpSpy Made By Monia\n--Logging Start:\n'..code)
	elseif isfile('httpSpy/'..file) then
		appendfile('httpSpy/'..file, '\n'..code)
	end
end

-- // Anti Log \\ --
local oldrequest
oldrequest = hookfunctions(requests, newcclosure(function(req)
	if req.Url:find('discord') and req.Url:find('webhooks') or not req.Url:find('discord') and not req.Url:find('webhooks') then
		print('Detected Request: '.. req.Url)
		detectLink('request.log', 'Request', req.Url)
		if HttpSpySettings['Notifications'] then
			sendNotification('Request', 'request detected: '.. req.Url)
		end
		if HttpSpySettings['AntiRequest'] then
			return nil
		end
	end
	return oldrequest(req)
end))

-- // Spy #1 \\ --
local oldHttpGet
oldHttpGet = hookfunctions(game.HttpGet, newcclosure(function(newgame, url)
	if url:find('github') or url:find('pastebin') or not url:find('github') or not url:find('pastebin') then
		print('Detected Link: '.. url)
		detectLink('Http.log', 'Http', url)
		if HttpSpySettings['Notifications'] then
			sendNotification('HttpGet', 'http detected: '.. url)
		end
		if HttpSpySettings['AntiHttpGet'] then
			return nil
		end
	end
	return oldHttpGet(newgame, url)
end))

old = hookmetamethod(game, '__namecall', newcclosure(function(self, url, ...)
	if getnamecallmethod() == 'HttpGet' then
		local retur = true
		for i,v in 	httpSpyDetected.malicious do
			if url:find(v) then
				detectLink('Http.log', 'Http', url)
				retur = true
				break
			end
		end
		if retur then
			return old(self, '', ...)
		end
	end
	return old(self, url, ...)
end))

--[[
--// In Dev \\ --
-- // Spy #2 \\ --
local oldHttpGetAsync
oldHttpGetAsync = hookfunctions(game.HttpGetAsync, newcclosure(function(newgame, url)
	if url:find('github') or url:find('pastebin') or not url:find('github') or not url:find('pastebin') then
		print('Detected Link: '.. url)
		detectLink('Http.log', 'Http', url)
		if HttpSpySettings['Notifications'] then
			sendNotification('HttpGet', 'http detected: '.. url)
		end
		if HttpSpySettings['AntiHttpGet'] then
			return nil
		end
	end
	return oldHttpGet(newgame, url)
end))
]]

-- // Anti Kick \\ --
if HttpSpySettings['AntiKick'] then
	setreadonly(getrawmetatable(game), false)
	local mt = getrawmetatable(game) or getmetatable(game)
	local __oldnamecall = mt.__namecall
	mt.__namecall = newcclosure(function(self, ...)
		local args = {...}
		local namecallmethod = getnamecallmethod()
		if self == plr and string.lower(namecallmethod) == 'kick' then
			task.wait(math.huge)
			return nil
		elseif string.lower(namecallmethod) == 'shutdown' then
			task.wait(math.huge)
			return nil
		end
		return __oldnamecall(self, unpack(args))
	end)
	setreadonly(getrawmetatable(game), true)
end

-- // Anti FPS \\ --
if HttpSpySettings['AntiFPS'] then
	local fpsfunc = setfpscap
	local oldcrash
	local nineEnine = function()
		-- have to make the real value of 9e9 for funny reason lol
		return 9000000000
	end
	local oneFps = function()
		return 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9
	end
	local tenFps = function()
		return 10 or 11 or 12 or 13 or 14 or 15 or 16 or 18 or 18 or 19
	end
	local minusFps = function()
		return -1 or -2 or -3 or -4 or -5 or -6 or -7 or -8 or -9
	end
	oldcrash = hookfunctions(fpsfunc, newcclosure(function(value)
		-- wtf is this
		if value:len() >= 10 and value:sub(1,10) == nineEnine() or value:len() >= 3 and value:sub(1,3) == 9e9 or value:len() >= 9 and value:sub(1,9) == math.huge or value:len() >= 1 and value:sub(1,1) == 0 or value:len() >= 1 and value:sub(1,1) == oneFps() or value:len() >= 2 and value:sub(1,2) == minusFps() or value:len() >= 2 and value:sub(1,3) == tenFps() then
			return 144
		end
		return oldcrash(value)
	end))
end