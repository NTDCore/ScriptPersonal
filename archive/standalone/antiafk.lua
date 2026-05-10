local cloneref = cloneref or function(...) return ... end
local service = setmetatable({}, {
	__index = function(self, idx)
		self[idx] = cloneref(game:GetService(idx))
		return self[idx]
	end
})

local players = service.Players

local lplr = players.LocalPlayer

local getconnections = getconnections

for _, v in getconnections(lplr.Idled) do v:Disable() end