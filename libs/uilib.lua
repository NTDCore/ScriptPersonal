local uilib = {
	categories = {},
	connections = {},
	keybind = 'RightShift',
	signals = {
		selfdestruct = {}
	}
}

local cloneref = cloneref or function(...) return ... end
local inputService = cloneref(game:GetService('UserInputService'))
local tweenService = cloneref(game:GetService('TweenService'))
local uipallet = {
	Toggle = {
		Enable = Color3.fromRGB(5, 133, 104),
		Disable = Color3.fromRGB(62, 62, 62)
	},
	Keybind = {
		Enable = Color3.fromRGB(4, 106, 82),
		Disable = Color3.fromRGB(84, 84, 84)
	},
	Text = Color3.fromRGB(218, 218, 218)
}

function uilib:Init()
	function uilib:dragging(frame, parent)
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
	local MainGui = Instance.new('ScreenGui')
	MainGui.Name = 'MainGui'
	MainGui.Parent = gethui and gethui() or game:GetService('CoreGui')
	MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	uilib.MainGui = MainGui
	local MainFrame = Instance.new('Frame')
	MainFrame.Name = 'MainFrame'
	MainFrame.Parent = MainGui
	MainFrame.Active = true
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 547, 0, 313)
	local UICorner = Instance.new('UICorner')
	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = MainFrame
	local Categories = Instance.new('Folder')
	Categories.Name = 'Categories'
	Categories.Parent = MainFrame
	local ScrollingFrame = Instance.new('ScrollingFrame')
	ScrollingFrame.Parent = Categories
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.136, 0, 0.559, 0)
	ScrollingFrame.Size = UDim2.new(0, 134, 0, 262)
	ScrollingFrame.ScrollBarThickness = 0
	ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
	local UIListLayout = Instance.new('UIListLayout')
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.fromOffset(0, UIListLayout.AbsoluteContentSize.Y)
	end)
	local Top = Instance.new('Folder')
	Top.Name = 'Top'
	Top.Parent = MainFrame
	local Tab = Instance.new('Frame')
	Tab.Name = 'Tab'
	Tab.Parent = Top
	Tab.AnchorPoint = Vector2.new(0.5, 0.5)
	Tab.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
	Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab.BorderSizePixel = 0
	Tab.Position = UDim2.new(0.501142621, 0, 0.071, 0)
	Tab.Size = UDim2.new(0, 533, 0, 28)
	local corner5 = Instance.new('UICorner')
	corner5.CornerRadius = UDim.new(0, 15)
	corner5.Parent = Tab
	local Toggle = Instance.new('TextButton')
	Toggle.Name = 'Toggle'
	Toggle.Parent = Tab
	Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
	Toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.BorderSizePixel = 0
	Toggle.Position = UDim2.new(0.97, 0, 0.47, 0)
	Toggle.Size = UDim2.new(0, 16, 0, 16)
	Toggle.AutoButtonColor = false
	Toggle.Font = Enum.Font.SourceSans
	Toggle.Text = ''
	Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.TextSize = 14
	local corner6 = Instance.new('UICorner')
	corner6.CornerRadius = UDim.new(10, 0)
	corner6.Parent = Toggle
	local CategoriesModule = Instance.new('Folder')
	CategoriesModule.Name = 'CategoriesModule'
	CategoriesModule.Parent = MainFrame
	
	self:dragging(MainFrame)
	function uilib:CreateCategory(name)
		local categories = {
			Button = Instance.new('TextButton'),
			Frame = Instance.new('ScrollingFrame'),
			UIListLayout = Instance.new('UIListLayout')
		}
		local Category = categories.Button
		Category.Name = name..'Category'
		Category.Parent = ScrollingFrame
		Category.Active = true
		Category.AnchorPoint = Vector2.new(0.5, 0.5)
		Category.BackgroundColor3 = uipallet.Toggle.Disable
		Category.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Category.BorderSizePixel = 0
		Category.Position = UDim2.new(0.5, 0, 0.063, 0)
		Category.Size = UDim2.new(0, 134, 0, 33)
		Category.AutoButtonColor = false
		Category.Font = Enum.Font.SourceSansBold
		Category.Text = name
		Category.TextColor3 = uipallet.Text
		Category.TextSize = 16
		self.categories[name] = {}
		self.categories[name].Children = categories
		local corner = Instance.new('UICorner')
		corner.Parent = Category
		categories.Frame.Parent = CategoriesModule
		categories.Frame.Active = true
		categories.Frame.Visible = false
		categories.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		categories.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		categories.Frame.BackgroundTransparency = 1
		categories.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		categories.Frame.BorderSizePixel = 0
		categories.Frame.Position = UDim2.new(0.632, 0, 0.559, 0)
		categories.Frame.Size = UDim2.new(0, 389, 0, 262)
		categories.Frame.ScrollBarThickness = 0
		categories.Frame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
		categories.UIListLayout.Parent = categories.Frame
		categories.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		categories.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		categories.UIListLayout.Padding = UDim.new(0, 5)
		categories.UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			categories.Frame.CanvasSize = UDim2.fromOffset(0, categories.UIListLayout.AbsoluteContentSize.Y)
		end)
		local categoriesapi = {
			labels = {},
			toggles = {}
		}
		Category.MouseButton1Click:Connect(function()
			self.categories[name].Children.Frame.Visible = true
			self.categories[name].Children.Button.BackgroundColor3 = uipallet.Toggle.Enable
			for i,v in self.categories do
				if v.Children.Button.Text ~= name and v.Children.Button.BackgroundColor3 == uipallet.Toggle.Enable then
					v.Children.Button.BackgroundColor3 = uipallet.Toggle.Disable
					v.Children.Frame.Visible = false
				end
			end
		end)
		function categoriesapi:CreateLabel(name)
			local label = Instance.new('TextLabel')
			local corner = Instance.new('UICorner')
			label.Name = 'label'
			label.Parent = categories.Frame
			label.AnchorPoint = Vector2.new(0.5, 0.5)
			label.BackgroundColor3 = Color3.fromRGB(5, 133, 104)
			label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			label.BorderSizePixel = 0
			label.Size = UDim2.new(0, 386, 0, 33)
			label.Font = Enum.Font.SourceSansBold
			label.Text = '     '..name
			label.TextColor3 = Color3.fromRGB(218, 218, 218)
			label.TextSize = 17
			label.TextXAlignment = Enum.TextXAlignment.Left
			corner.Parent = label
			self.labels[name..'label'] = {}
			self.labels[name..'label'].Name = name
			self.labels[name..'label'].Parent = label
			local labelapi = {}
			function labelapi:set(text)
				label.Text = '     '..text
			end
			function labelapi:hidden(state)
				if state ~= nil then
					label.Visible = state
				else
					label.Visible = not label.Visible
				end
			end
			return labelapi
		end
		function categoriesapi:CreateToggle(args)
			local toggleapi = {Enabled = false, Keybind = 'None', Connections = {}, Module = args.Name}
			local toggle = Instance.new('TextButton')
			toggle.Name = 'toggle'
			toggle.Parent = categories.Frame
			toggle.AnchorPoint = Vector2.new(0.5, 0.5)
			toggle.BackgroundColor3 = uipallet.Toggle.Disable
			toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggle.BorderSizePixel = 0
			toggle.Position = UDim2.new(0.503, 0, 0.063, 0)
			toggle.Size = UDim2.new(0, 386, 0, 33)
			toggle.AutoButtonColor = false
			toggle.Font = Enum.Font.SourceSansBold
			toggle.Text = '     '..args.Name
			toggle.TextColor3 = Color3.fromRGB(218, 218, 218)
			toggle.TextSize = 17
			toggle.TextXAlignment = Enum.TextXAlignment.Left
			local UICorner_8 = Instance.new('UICorner')
			local toggle_2 = Instance.new('TextButton')
			local UICorner_9 = Instance.new('UICorner')
			UICorner_8.Parent = toggle
			toggle_2.Name = 'toggle'
			toggle_2.Parent = toggle
			toggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
			toggle_2.BackgroundColor3 = uipallet.Keybind.Disable
			toggle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggle_2.BorderSizePixel = 0
			toggle_2.Position = UDim2.new(0.911, 0, 0.472, 0)
			toggle_2.Size = UDim2.new(0, 27, 0, 27)
			toggle_2.AutoButtonColor = false
			toggle_2.Font = Enum.Font.SourceSansBold
			toggle_2.Text = args.Keybind or 'None'
			toggle_2.TextColor3 = Color3.fromRGB(218, 218, 218)
			toggle_2.TextSize = 15
			UICorner_9.Parent = toggle_2
			toggle.MouseButton1Click:Connect(function()
				--[[if not toggleapi.Enabled then
					toggleapi.Enabled = not toggleapi.Enabled
					local success, response = pcall(args.Function, toggleapi.Enabled)
					toggle.BackgroundColor3 = uipallet.Toggle.Enable
					toggle_2.BackgroundColor3 = uipallet.Keybind.Enable
				else
					toggleapi.Enabled = not toggleapi.Enabled
					local success, response = pcall(args.Function, toggleapi.Enabled)
					toggle.BackgroundColor3 = uipallet.Toggle.Disable
					toggle_2.BackgroundColor3 = uipallet.Keybind.Disable
				end]]
				toggleapi.Enabled = not toggleapi.Enabled
				local success, response = pcall(args.Function, toggleapi.Enabled)
				tweenService:Create(toggle, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
					BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
				}):Play()
				tweenService:Create(toggle_2, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
					BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
				}):Play()
				--toggle.BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
				--toggle_2.BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
			end)
			local binding = false
			toggle_2.MouseButton1Click:Connect(function()
				if not binding then
					binding = true
					toggle_2.Text = '...'
					local key, bind = inputService.InputBegan:Wait()
					if key.KeyCode.Name ~= 'Unknown' then
						toggle_2.Text = key.KeyCode.Name
						toggleapi.Keybind = key.KeyCode.Name
						binding = false
					end
				end
			end)
			inputService.InputBegan:Connect(function(input)
				if input.KeyCode.Name == toggle_2.Text then
					toggleapi.Enabled = not toggleapi.Enabled
					local success, response = pcall(args.Function, toggleapi.Enabled)
					tweenService:Create(toggle, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
						BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
					}):Play()
					tweenService:Create(toggle_2, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
						BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
					}):Play()
					--toggle.BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
					--toggle_2.BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
				end
			end)
			function toggleapi:Toggle(bool)
				if bool ~= nil then
					toggleapi.Enabled = bool
					local success, response = pcall(args.Function, toggleapi.Enabled)
					tweenService:Create(toggle, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
						BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
					}):Play()
					tweenService:Create(toggle_2, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
						BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
					}):Play()
					--toggle.BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
					--toggle_2.BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
				else
					toggleapi.Enabled = not toggleapi.Enabled
					local success, response = pcall(args.Function, toggleapi.Enabled)
					tweenService:Create(toggle, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
						BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
					}):Play()
					tweenService:Create(toggle_2, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
						BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
					}):Play()
					--toggle.BackgroundColor3 = toggleapi.Enabled and uipallet.Toggle.Enable or uipallet.Toggle.Disable
					--toggle_2.BackgroundColor3 = toggleapi.Enabled and uipallet.Keybind.Enable or uipallet.Keybind.Disable
				end
			end
			if args.Default then
				toggleapi:Toggle(args.Default)
			end
			return toggleapi
		end
		return categoriesapi
	end
	function uilib:OnSelfdestruct(func)
		table.insert(self.signals.selfdestruct, func)
	end
	function uilib:selfdestruct()
		local success, response = pcall(function()
			for i,v in self.signals.selfdestruct do
				local success, response = pcall(v)
				if success then return end
				if not success then error(response) end
			end
		end)
		self.MainGui:Destroy()
	end
end

return uilib