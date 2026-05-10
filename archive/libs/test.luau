-- https://luau.github.io/UniversalSynSaveInstance/api/SynSaveInstance
local lib = {
	color = 'new',
	assets = {
		['personalscripts/assets/synapselogo.png'] = 'rbxassetid://78268396149727',
		['personalscripts/assets/closeicon.png'] = 'rbxassetid://81055944487878'
	}
}
local identifyexecutor = identifyexecutor or function() return 'Roblox', 'Studio' end
local getgenv = getgenv or function()
	return {}
end
if identifyexecutor():find('Xeno') then
	getgenv().cloneref = nil
end
local cloneref = cloneref or function(...) return ... end
local runService = cloneref(game:GetService('RunService'))
local inputService = cloneref(game:GetService('UserInputService'))
local tweenService = cloneref(game:GetService('TweenService'))
local gethui = gethui or function()
	if runService:IsStudio() then
		return cloneref(game:GetService('Players')).LocalPlayer.PlayerGui
	end
	return cloneref(game:GetService('CoreGui'))
end

local colorpallet = {
	new = {
		text = Color3.fromRGB(185, 212, 255),
		background1 = Color3.fromRGB(0, 11, 29),
		background2 = Color3.fromRGB(0, 18, 44),
		element = Color3.fromRGB(0, 29, 70)
	},
	old = {
		text = Color3.fromRGB(185, 212, 255),
		background1 = Color3.fromRGB(0, 11, 29),
		background2 = Color3.fromRGB(0, 18, 44),
		element = Color3.fromRGB(0, 29, 70)
	}
}
local getcustomasset = getcustomasset or function(picture)
	return lib.assets[picture] or ''
end
local downloadasset = function(asset)
	local subbed = string.gsub(asset, 'personalscripts/', '')
	if not isfile(asset) then
		writefile(asset, game:HttpGet('https://raw.githubusercontent.com/NTDCore/ScriptPersonal/main/'..subbed))
	end
	return getcustomasset(asset)
end
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
function lib:Init(n, p)
	local Screen = Instance.new('ScreenGui')
	Screen.Name = randomString()
	Screen.Parent = p or gethui()
	Screen.ResetOnSpawn = false
	Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local adasd = Instance.new('UIScale')
	adasd.Name = randomString()
	adasd.Parent = Screen
	function lib:scale(val)
		adasd.Scale = tonumber(val)
	end
	local qwdqww = Instance.new('Frame')
	qwdqww.ZIndex = 200
	qwdqww.Active = true
	qwdqww.Name = randomString()
	qwdqww.Parent = Screen
	qwdqww.AnchorPoint = Vector2.new(0.5, 0.5)
	qwdqww.BackgroundColor3 = colorpallet[self.color].background1
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
	lo.TextColor3 = colorpallet[self.color].text
	lo.TextSize = 21
	lo.TextWrapped = true
	local qdddd = Instance.new('Frame')
	qdddd.Parent = qwdqww
	qdddd.BackgroundColor3 = colorpallet[self.color].background2
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
	SDQWD.BackgroundColor3 = colorpallet[self.color].background2
	SDQWD.BackgroundTransparency = 1
	SDQWD.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SDQWD.BorderSizePixel = 0
	SDQWD.Position = UDim2.new(0.5, 0, 0.512, 0)
	SDQWD.Size = UDim2.new(0, 268, 0, 270)
	SDQWD.CanvasSize = UDim2.new(0, 0, 1, 0)
	SDQWD.ScrollBarImageColor3 = colorpallet[self.color].text
	SDQWD.ScrollBarThickness = 2
	local ddd = Instance.new('UIListLayout')
	ddd.Name = randomString()
	ddd.Parent = SDQWD
	ddd.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ddd.SortOrder = Enum.SortOrder.LayoutOrder
	ddd.Padding = UDim.new(0, 5)
	local BMEHRSKJICVYJ = Instance.new('ImageButton', qwdqww)
	BMEHRSKJICVYJ.ImageColor3 = colorpallet[self.color].text
	BMEHRSKJICVYJ.ClipsDescendants = false
	BMEHRSKJICVYJ.AnchorPoint = Vector2.new(0.5, 0.5)
	BMEHRSKJICVYJ.Image = lib.assets['personalscripts/assets/closeicon.png']
	BMEHRSKJICVYJ.BackgroundTransparency = 1
	BMEHRSKJICVYJ.Position = UDim2.fromScale(0.931999981, 0.0579999983)
	BMEHRSKJICVYJ.Name = randomString()
	BMEHRSKJICVYJ.BackgroundColor3 = Color3.new(1, 1, 1)
	BMEHRSKJICVYJ.BorderSizePixel = 0
	BMEHRSKJICVYJ.Size = UDim2.fromOffset(24, 24)
	BMEHRSKJICVYJ.MouseButton1Click:Connect(function()
		qwdqww.Visible = false
	end)
	local XJZQTPXLQWJZAZMCTQU = Instance.new('ImageButton', Screen) 
	XJZQTPXLQWJZAZMCTQU.ImageColor3 = colorpallet[self.color].text
	XJZQTPXLQWJZAZMCTQU.AutoButtonColor = false
	XJZQTPXLQWJZAZMCTQU.ScaleType = Enum.ScaleType.Fit
	XJZQTPXLQWJZAZMCTQU.ClipsDescendants = false
	XJZQTPXLQWJZAZMCTQU.AnchorPoint = Vector2.new(0.5, 0.5)
	XJZQTPXLQWJZAZMCTQU.Image = lib.assets['personalscripts/assets/synapselogo.png']
	XJZQTPXLQWJZAZMCTQU.Name = randomString()
	XJZQTPXLQWJZAZMCTQU.Position = UDim2.fromScale(0.928, 0.498)
	XJZQTPXLQWJZAZMCTQU.BackgroundColor3 = Color3.new(0, 0.113725, 0.27451)
	XJZQTPXLQWJZAZMCTQU.BorderSizePixel = 0
	XJZQTPXLQWJZAZMCTQU.Size = UDim2.fromOffset(35, 35)
	XJZQTPXLQWJZAZMCTQU.MouseButton1Click:Connect(function()
		qwdqww.Visible = not qwdqww.Visible
	end)
	lib:dragging(XJZQTPXLQWJZAZMCTQU)
	Instance.new('UICorner', XJZQTPXLQWJZAZMCTQU).CornerRadius = UDim.new(10, 0)
	local HWDYPXNKWRO = Instance.new('UIStroke', XJZQTPXLQWJZAZMCTQU) 
	HWDYPXNKWRO.Color = colorpallet[self.color].background2
	HWDYPXNKWRO.Thickness = 4.5
	local ZIRODNXVBFGSNPOXWWXS = Instance.new('ImageLabel', qwdqww)
	ZIRODNXVBFGSNPOXWWXS.ImageColor3 = colorpallet[self.color].text
	ZIRODNXVBFGSNPOXWWXS.ClipsDescendants = false
	ZIRODNXVBFGSNPOXWWXS.Name = randomString()
	ZIRODNXVBFGSNPOXWWXS.AnchorPoint = Vector2.new(0.5, 0.5)
	ZIRODNXVBFGSNPOXWWXS.Image = lib.assets['personalscripts/assets/synapselogo.png']
	ZIRODNXVBFGSNPOXWWXS.BackgroundTransparency = 1
	ZIRODNXVBFGSNPOXWWXS.Position = UDim2.fromScale(0.08, 0.068)
	ZIRODNXVBFGSNPOXWWXS.BackgroundColor3 = Color3.new(1, 1, 1)
	ZIRODNXVBFGSNPOXWWXS.Active = false
	ZIRODNXVBFGSNPOXWWXS.BorderSizePixel = 0
	ZIRODNXVBFGSNPOXWWXS.Size = UDim2.fromOffset(31, 30)
	ddd:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		SDQWD.CanvasSize = UDim2.fromOffset(0, ddd.AbsoluteContentSize.Y)
	end)
	function lib:change_color(n)
		if colorpallet[n] then
			self.color = tostring(n)
		end
	end
	function lib:createbutton(text, func)
		local but = Instance.new('TextButton')
		but.Name = randomString()
		but.Parent = SDQWD
		but.AnchorPoint = Vector2.new(0.5, 0.5)
		but.BackgroundColor3 = colorpallet[self.color].element
		but.BorderColor3 = Color3.fromRGB(0, 0, 0)
		but.BorderSizePixel = 0
		but.Position = UDim2.new(0.512, 0, 0.063, 0)
		but.Size = UDim2.new(0, 261, 0, 34)
		but.AutoButtonColor = false
		but.Font = Enum.Font.SourceSansBold
		but.Text = text or 'Button'
		but.TextColor3 = colorpallet[self.color].text
		but.TextSize = 21
		local corner = Instance.new('UICorner')
		corner.CornerRadius = UDim.new(0, 5)
		corner.Name = randomString()
		corner.Parent = but
		but.MouseButton1Click:Connect(function()
			local success, response = pcall(func)
			if not success then error(response) end
			return response
		end)
	end
	function lib:createlabel(txt, hidden)
		local label = {}
		local labellol = Instance.new('TextLabel')
		labellol.Name = randomString()
		labellol.Parent = SDQWD
		labellol.AnchorPoint = Vector2.new(0.5, 0.5)
		labellol.BackgroundColor3 = colorpallet[self.color].element
		labellol.BorderColor3 = Color3.fromRGB(0, 0, 0)
		labellol.BorderSizePixel = 0
		labellol.Position = UDim2.new(0.512, 0, 0.063, 0)
		labellol.Size = UDim2.new(0, 261, 0, 34)
		labellol.Font = Enum.Font.SourceSansBold
		labellol.Text = txt or 'Label'
		labellol.TextColor3 = colorpallet[self.color].text
		labellol.TextSize = 21
		local labelcorner = Instance.new('UICorner')
		labelcorner.CornerRadius = UDim.new(0, 5)
		labelcorner.Name = randomString()
		labelcorner.Parent = labellol
		function label:text(txt)
			labellol.Text = tostring(txt) or labellol.Text
		end
		function label:visible(bool)
			labellol.Visible = bool or not labellol.Visible
		end
		return label
	end
end

return lib
