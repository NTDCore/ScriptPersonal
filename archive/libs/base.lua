local uilib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NTDCore/ScriptPersonal/main/libs/uilib.lua'))()
uilib:Init()

local categories = {
	Main = uilib:CreateCategory('Main'),
	Settings = uilib:CreateCategory('Settings')
}

local skibidi_speed = {Enabled = false}
local oldspeed
skibidi_speed = categories.Main:CreateToggle({
	Name = 'Speed',
	Function = function(callback)
		if callback then
			oldspeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 54
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = oldspeed
			oldspeed = nil
		end
	end
})

categories.Settings:CreateToggle({
	Name = 'Click Gui',
	Default = uilib.MainGui.Enabled,
	Keybind = 'RightShift',
	Function = function(callback)
		uilib.MainGui.Enabled = callback
	end
})