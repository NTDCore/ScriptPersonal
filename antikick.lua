local cloneref = cloneref or function(...) return ... end
local service = setmetatable({}, {
	__index = function(self, idx)
		self[idx] = cloneref(game:GetService(idx))
		return self[idx]
	end
})

local players = service.Players

local lplr = players.LocalPlayer

local hookmetamethod = hookmetamethod
local newcclosure = newcclosure

local old
old=hookmetamethod(game,'__namecall',newcclosure(function(self, ...)
	if checkcaller()and self == lplr and table.find({'kick', 'shutdown'}. string.lower(getnamecallmethod())) then return nil end
	return old(self, ...)
end))