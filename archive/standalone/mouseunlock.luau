shared.UnlockKeybind = Enum.KeyCode.KeypadSeven
local cloneref = cloneref or function(...) return ... end
local gethui = gethui or function() return cloneref(game:GetService('CoreGui')) end
local inputService = cloneref(game:GetService('UserInputService'))
local runService = game:GetService("RunService")
local inputService = game:GetService("UserInputService")

local Screen = Instance.new('ScreenGui')
Screen.Name = math.random(1, 20)
Screen.Parent = gethui()
Screen.ResetOnSpawn = false
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local ZToUnlockMouse = Instance.new('TextLabel', Screen)
ZToUnlockMouse.TextWrapped = true
ZToUnlockMouse.Active = false
ZToUnlockMouse.TextTransparency = 0.74
ZToUnlockMouse.TextSize = 14
ZToUnlockMouse.Size = UDim2.fromScale(0.115, 0.061)
ZToUnlockMouse.TextColor3 = Color3.new(1, 1, 1)
ZToUnlockMouse.Text = shared.UnlockKeybind.Name..' to unlock mouse'
ZToUnlockMouse.Name = 'ZToUnlockMouse'
ZToUnlockMouse.ClipsDescendants = false
ZToUnlockMouse.BorderSizePixel = 0
ZToUnlockMouse.Font = Enum.Font.SourceSans
ZToUnlockMouse.BackgroundTransparency = 1
ZToUnlockMouse.Position = UDim2.fromScale(0.875, 0.926)
ZToUnlockMouse.TextXAlignment = Enum.TextXAlignment.Right
ZToUnlockMouse.TextYAlignment = Enum.TextYAlignment.Bottom
ZToUnlockMouse.TextScaled = true
ZToUnlockMouse.BackgroundColor3 = Color3.new(1, 1, 1)

inputService.InputBegan:Connect(function(arg1, arg2) -- Line 5
	if not arg2 and arg1.KeyCode == shared.UnlockKeybind then
		var2_upvw = not var2_upvw
		if var2_upvw then
			runService:BindToRenderStep("unlock", Enum.RenderPriority.Camera.Value + 10, function() -- Line 12
				inputService.MouseBehavior = Enum.MouseBehavior.Default
			end)
			return
		end
		runService:UnbindFromRenderStep("unlock")
		inputService.MouseBehavior = Enum.MouseBehavior.LockCenter
	end
end)