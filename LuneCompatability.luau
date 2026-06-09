local identifyexecutor = identifyexecutor or function() return 'Lune' end
local IsLune = identifyexecutor() == 'Lune'

if not IsLune then
	return getgenv
end

local getgenv
local env = {}

env.game = {}
setmetatable(env.game, {
	__index = {
		GetService = function(self, service)
			return self[service]
		end
	}
})
env.require = function(module) end

getgenv = function()
	return env
end

return getgenv