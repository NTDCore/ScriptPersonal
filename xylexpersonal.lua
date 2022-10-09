wait(1)
        local textlab = Instance.new("TextLabel")
        textlab.Size = UDim2.new(0, 200, 0, 28)
        textlab.BackgroundTransparency = 1
        textlab.TextColor3 = Color3.new(1, 1, 1)
        textlab.TextStrokeTransparency = 0
        textlab.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
        textlab.Font = Enum.Font.SourceSans
        textlab.TextSize = 28
        textlab.Text = "1 ms"
        textlab.BackgroundColor3 = Color3.new(0, 0, 0)
        textlab.Position = UDim2.new(1, -254, 0, -33)
        textlab.TextXAlignment = Enum.TextXAlignment.Right
        textlab.BorderSizePixel = 0
        textlab.Parent = game.CoreGui.RobloxGui
        spawn(function()
            repeat
                wait(1)
                local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
                ping = math.floor(ping)
                textlab.Text = ping.." ms"
            until textlab == nil
        end)
wait(1)
local yes = game.CoreGui:WaitForChild("RobloxLoadingGui")
local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 80, 255)),ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 255)),ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))})
uigradient.Rotation = 45
yes:GetChildren()[1].BackgroundColor3 = Color3.new(1, 1, 1)
uigradient.Parent = yes:GetChildren()[1]
wait(1)
repeat
    wait()
until game:GetService("Players")

repeat
    wait()
until game:GetService("Players").LocalPlayer

local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(game:GetService("Players").LocalPlayer.Idled)) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
end
wait(1)
if shared.VapeFullyLoaded then
repeat task.wait() until game:IsLoaded()
if game.GameId ~= 2619619496 then return end
local cam
repeat
	task.wait(0.1)
	for i,v in pairs(getconnections(workspace.CurrentCamera:GetPropertyChangedSignal("CameraType"))) do 
		if v.Function then
			cam = debug.getupvalue(v.Function, 1)
		end
	end
until cam
local caminput = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule.CameraModule.CameraInput)
local num = Instance.new("IntValue")
local numanim

shared.damageanim = function()
	if numanim then numanim:Cancel() end
    num.Value = 100
    numanim = game:GetService("TweenService"):Create(num, TweenInfo.new(0.5), {Value = 0})
    numanim:Play()
end

cam.Update = function(dt) 
	if cam.activeCameraController then
		cam.activeCameraController:UpdateMouseBehavior()

		local newCameraCFrame, newCameraFocus = cam.activeCameraController:Update(dt)

		game.Workspace.CurrentCamera.CFrame = newCameraCFrame * CFrame.Angles(0, 0, math.rad(num.Value / 10))
		game.Workspace.CurrentCamera.Focus = newCameraFocus

	
		if cam.activeTransparencyController then
			cam.activeTransparencyController:Update()
		end

		if caminput.getInputEnabled() then
			caminput.resetInputForFrameEnd()
		end
	end
 end
end
