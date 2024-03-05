-- Made By Monia Since 2/3/24
-- HttpSpy Powered By NSL

-- // Instance \\ --
if not shared.HttpSpy then
	shared.HttpSpy = {}
end
local HttpSpySettings = {
	['AntiHttpGet'] = shared.HttpSpy.AntiHttpGet or false,
	['AntiWebSocket'] = shared.HttpSpy.AntiWebSocket or false,
	['AntiRequest'] = shared.HttpSpy.AntiRequest or true,
	['AntiKick'] = shared.HttpSpy.AntiKick or false,
	['AntiFPS'] = shared.HttpSpy.AntiFPS or false
}
local hookmeta = hookmetamethod
local websock = WebSocket and WebSocket.Connect or WebSocket and WebSocket.connect
local hookfunct = hookfunc or hookfunction -- hookfunc in krampus lol
local lplr = game.Players.LocalPlayer
if not isfolder("httpSpy") then
	makefolder("httpSpy")
end
local writeDirectFile = function(file, code)
	return writefile("httpSpy/"..file, code)
end
local detectLink = function(file, logname, code)
	if (not isfile("httpSpy/"..file)) then
		writeDirectFile(file, "-- "..logname.." Log\n--HttpSpy Made By Monia\n--Logging Start:\n"..code)
	elseif isfile("httpSpy/"..file) then
		appendfile("httpSpy/"..file, "\n"..code)
	end
end

-- // Anti Log \\ --
local oldrequest
oldrequest = hookfunct(request, newcclosure(function(req)
	if req.Url:find("discord") or not req.Url:find('webhook') then
		detectLink("request.log", "Request", req.Url)
		if HttpSpySettings['AntiRequest'] then
			return nil
		end
	end
	return oldrequest(req)
end))

-- // Spy #1 \\ --
local oldHttpGet
oldHttpGet = hookfunct(game.HttpGet, newcclosure(function(newgame, url)
	if url:find("github") or url:find("pastebin") or not url:find('github') or not url:find('pastebin') then
		detectLink("Http.log", "Http", url)
		if HttpSpySettings['AntiHttpGet'] then
			return nil
		end
	end
	return oldHttpGet(newgame, url)
end))

-- // Anti FPS \\ --
if HttpSpySettings['AntiFPS'] then
	local fpsfunc = setfpscap
	local oldcrash
	local nineEnine = function()
		-- have to make the real value of 9e9 for funny reason lol
		return 9000000000
	end
	local oneFps = function()
		return 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9
	end
	local tenFps = function()
		return 10 or 11 or 12 or 13 or 14 or 15 or 16 or 18 or 18 or 19
	end
	local minusFps = function()
		return -1 or -2 or -3 or -4 or -5 or -6 or -7 or -8 or -9
	end
	oldcrash = hookfunct(fpsfunc, newcclosure(function(value)
		-- wtf is this
		if value:len() >= 10 and value:sub(1,10) == nineEnine() or value:len() >= 3 and value:sub(1,3) == 9e9 or value:len() >= 9 and value:sub(1,9) == math.huge or value:len() >= 1 and value:sub(1,1) == 0 or value:len() >= 1 and value:sub(1,1) == oneFps() or value:len() >= minusValue() and value:sub(1,2) == minusFps() or value:len() >= 2 and value:sub(1,3) == tenFps() then
			return 144
		end
		return oldcrash(value)
	end))
end