local cloneref = cloneref or function(obj)
	return obj
end
local players = cloneref(game:GetService('Players'))
local lplr = players.LocalPlayer
lplr:GetPropertyChangedSignal('GameplayPaused'):Connect(function()
	if lplr.GameplayPaused then
		lplr.GameplayPaused = false
	end
end)