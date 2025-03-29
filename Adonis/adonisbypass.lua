local identifyexecutor = identifyexecutor or function() return 'noname', 1
if identifyexecutor then
	if table.find({'Xeno', 'Solara'}, ({identifyexecutor()})[1]) then
		getgenv().getgc = nil
	end
end

local getgc = getgc or function() end
local rawget = rawget or function() end
local hookfunction = hookfunction or function() end
local getinfo = getinfo or debug.getinfo
local setthreadidentity = setthreadidentity or function(id) end
local getthreadidentity = getthreadidentity or function() return 7 end
local debugmode = false -- debug mode
local detected, kill

local flags = {}

local oldthreadidentity = getthreadidentity()
setthreadidentity(2)

for i,v in getgc(true) do
	if type(v) == 'table' and rawget(v, 'Detected') then
		local rawgets = {
			Detected = rawget(v, 'Detected'),
			Kill = rawget(v, 'Kill'),
			Crash = {
				Normal = rawget(v, 'Crash'),
				GPU = rawget(v, 'GPUCrash'),
				RAM = rawget(v, 'RAMCrash'),
				Hard = rawget(v, 'HardCrash')
			},
			SetFPS = rawget(v, 'SetFPS'),
			RestoreFPS = rawget(v, 'RestoreFPS')
		}

		if type(rawgets.Detected) == 'function' then
			detected = rawgets.Detected
			local detectedhook

			detectedhook = hookfunction(detected, function(a, b, c)
				if a ~= '_' then
					if debugmode then
						warn(`Flagged!\nMethod: {a}\nInfo: {b}`)
					end
				end

				return true
			end)

			table.insert(flags, detected)
		end

		if rawget(v, 'Variables') and rawget(v, 'Process') and type(rawgets.Kill) == 'function' then
			local killhook

			killhook = hookfunction(rawgets.Kill, function(fallback)
				if debugmode then
					warn(`Adonis tried to kill (fallback): {fallback}`)
				end
			end)

			table.insert(flags, rawgets.Kill)
		end

		table.foreach(rawgets.Crash, function(a, b)
			if type(b) == 'function' then
				local crashhook

				crashhook = hookfunction(b, function()
					if debugmode then
						warn(`Attempt to crash!\nMethod: {getinfo(b).name}`)
					end
				end)

				table.insert(flags, b)
			end
		end)

		if type(rawgets.SetFPS) == 'function' then
			local fpshook

			fpshook = hookfunction(rawgets.SetFPS, function(value)
				if debugmode then
					warn(`Adonis tried to change FPS: {value}`)
				end

				if type(rawgets.RestoreFPS) then
					rawgets.RestoreFPS()
				end
			end)

			table.insert(flags, rawgets.SetFPS)
		end
	end
end

local idkwhattocall

idkwhattocall = hookfunction(getrenv().debug.info, newcclosure(function(...)
	local action, fallback = ...

	if detected and action == detected then
		if debugmode then
			warn('successfully bypassed!')
		end

		return coroutine.yield(coroutine.running())
	end

	return idkwhattocall(...)
end))

setthreadidentity(oldthreadidentity)