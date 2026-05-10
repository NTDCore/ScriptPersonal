repeat task.wait() until game:IsLoaded()
local cloneref = cloneref or function(...) return ... end

local players = cloneref(game:GetService('Players'))
local lplr = players.LocalPlayer
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))

local getgc = getgc or function() end
local rawget = rawget or function() end

for i,v in getgc(true) do
	if type(v) == 'table' then
		local adonis = {
			Detected = rawget(v, 'Detected'),
			Kill = rawget(v, 'Kill'),
			GPUCrash = rawget(v, 'GPUCrash')
		}

		for a, b in adonis do
			if b ~= nil and type(b) == 'function' then
				print('Adonis detected: '..getinfo(b).name)
				break
			end
		end
	end
end