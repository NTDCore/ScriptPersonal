-- https://luau.github.io/UniversalSynSaveInstance/api/SynSaveInstance
local lib = {}
if identifyexecutor():find('Xeno') then
	getgenv().cloneref = nil
end
local cloneref = cloneref or function(...) return ... end
local gethui = gethui or function() return cloneref(game:GetService('CoreGui')) end
local inputService = cloneref(game:GetService('UserInputService'))
local tweenService = cloneref(game:GetService('TweenService'))
local randomString = function()
	local randomlength = math.random(10,100)
	local array = {}
	for i = 1, randomlength do
		table.insert(array, string.char(math.random(65, 90)))
	end
	return table.concat(array)
end
function lib:dragging(frame, parent)
	parent = parent or frame
	local dragging = false
	local dragInput, mousePos, framePos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			mousePos = input.Position
			framePos = parent.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	inputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
end
function lib:Init(n)
	local Screen = Instance.new('ScreenGui')
	Screen.Name = randomString()
	Screen.Parent = gethui()
	Screen.ResetOnSpawn = false
	Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local adasd = Instance.new('UIScale')
	adasd.Name = randomString()
	adasd.Parent = Screen
	function lib:scale(val)
		adasd.Scale = tonumber(val)
	end
	local qwdqww = Instance.new('Frame')
	qwdqww.Active = true
	qwdqww.Name = randomString()
	qwdqww.Parent = Screen
	qwdqww.AnchorPoint = Vector2.new(0.5, 0.5)
	qwdqww.BackgroundColor3 = Color3.fromRGB(0, 11, 29)
	qwdqww.BorderColor3 = Color3.fromRGB(0, 0, 0)
	qwdqww.BorderSizePixel = 0
	qwdqww.Position = UDim2.new(0.499, 0, 0.499, 0)
	qwdqww.Size = UDim2.new(0, 282, 0, 322)
	lib:dragging(qwdqww)
	local qwd = Instance.new('UICorner')
	qwd.CornerRadius = UDim.new(0, 5)
	qwd.Name = randomString()
	qwd.Parent = qwdqww
	local lo = Instance.new('TextLabel')
	lo.Text = n or 'Script'
	lo.Name = randomString()
	lo.Parent = qwdqww
	lo.AnchorPoint = Vector2.new(0.5, 0.5)
	lo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	lo.BackgroundTransparency = 1
	lo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	lo.BorderSizePixel = 0
	lo.Position = UDim2.new(0.5, 0, 0.059, 0)
	lo.Size = UDim2.new(0, 282, 0, 38)
	lo.Font = Enum.Font.SourceSansBold
	lo.TextColor3 = Color3.fromRGB(185, 212, 255)
	lo.TextSize = 21
	lo.TextWrapped = true
	local qdddd = Instance.new('Frame')
	qdddd.Parent = qwdqww
	qdddd.BackgroundColor3 = Color3.fromRGB(0, 18, 44)
	qdddd.BorderColor3 = Color3.fromRGB(0, 0, 0)
	qdddd.BorderSizePixel = 0
	qdddd.Position = UDim2.new(0.025, 0, 0.118, 0)
	qdddd.Size = UDim2.new(0, 268, 0, 277)
	local qwd_2 = Instance.new('UICorner')
	qwd_2.CornerRadius = UDim.new(0, 5)
	qwd_2.Name = randomString()
	qwd_2.Parent = qdddd
	local SDQWD = Instance.new('ScrollingFrame')
	SDQWD.Name = randomString()
	SDQWD.Parent = qdddd
	SDQWD.Active = true
	SDQWD.AnchorPoint = Vector2.new(0.5, 0.5)
	SDQWD.BackgroundColor3 = Color3.fromRGB(0, 18, 44)
	SDQWD.BackgroundTransparency = 1
	SDQWD.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SDQWD.BorderSizePixel = 0
	SDQWD.Position = UDim2.new(0.5, 0, 0.512, 0)
	SDQWD.Size = UDim2.new(0, 268, 0, 270)
	SDQWD.CanvasSize = UDim2.new(0, 0, 1, 0)
	SDQWD.ScrollBarThickness = 2
	local ddd = Instance.new('UIListLayout')
	ddd.Name = randomString()
	ddd.Parent = SDQWD
	ddd.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ddd.SortOrder = Enum.SortOrder.LayoutOrder
	ddd.Padding = UDim.new(0, 5)
	ddd:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		SDQWD.CanvasSize = UDim2.fromOffset(0, ddd.AbsoluteContentSize.Y)
	end)
	function lib:createbutton(text, func)
		local but = Instance.new('TextButton')
		but.Name = randomString()
		but.Parent = SDQWD
		but.AnchorPoint = Vector2.new(0.5, 0.5)
		but.BackgroundColor3 = Color3.fromRGB(0, 29, 70)
		but.BorderColor3 = Color3.fromRGB(0, 0, 0)
		but.BorderSizePixel = 0
		but.Position = UDim2.new(0.512, 0, 0.063, 0)
		but.Size = UDim2.new(0, 261, 0, 34)
		but.AutoButtonColor = false
		but.Font = Enum.Font.SourceSansBold
		but.Text = text or 'Button'
		but.TextColor3 = Color3.fromRGB(185, 212, 255)
		but.TextSize = 21
		local qwd_3 = Instance.new('UICorner')
		qwd_3.CornerRadius = UDim.new(0, 5)
		qwd_3.Name = randomString()
		qwd_3.Parent = but
		but.MouseButton1Click:Connect(function()
			local success, response = pcall(func)
			if not success then error(response) end
			return response
		end)
	end
	function lib:createlabel(txt, hidden)
		local label = {}
		local but = Instance.new('TextLabel')
		but.Name = randomString()
		but.Parent = SDQWD
		but.AnchorPoint = Vector2.new(0.5, 0.5)
		but.BackgroundColor3 = Color3.fromRGB(0, 29, 70)
		but.BorderColor3 = Color3.fromRGB(0, 0, 0)
		but.BorderSizePixel = 0
		but.Position = UDim2.new(0.512, 0, 0.063, 0)
		but.Size = UDim2.new(0, 261, 0, 34)
		but.Font = Enum.Font.SourceSansBold
		but.Text = txt or 'Label'
		but.TextColor3 = Color3.fromRGB(185, 212, 255)
		but.TextSize = 21
		local qwd_3 = Instance.new('UICorner')
		qwd_3.CornerRadius = UDim.new(0, 5)
		qwd_3.Name = randomString()
		qwd_3.Parent = but
		function label:text(txt)
			but.Text = tostring(txt) or but.Text
		end
		function label:visible(bool)
			but.Visible = bool or not but.Visible
		end
		return label
	end
end

return lib