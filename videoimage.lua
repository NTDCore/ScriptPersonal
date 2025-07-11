repeat task.wait() until game:IsLoaded()

if shared.mainapi then
	shared.mainapi:Shutdown()
end

local mainapi = {}
shared.mainapi = mainapi

local getcustomasset = getcustomasset

local randomString = function(length)
	local list = {}
	for i = 1, length or math.random(10, 25) do
		table.insert(list, string.char(math.random(48, 122)))
	end

	return table.concat(list)
end

local gui = Instance.new('ScreenGui') 
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Name = randomString()
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = gethui()
mainapi.screenGui = gui

function mainapi:new(image)
	if image:find('.webm') then
		self.ImageLabel = Instance.new('VideoFrame', gui)
		self.ImageLabel.Name = randomString()
		self.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		self.ImageLabel.Video = image
		self.ImageLabel.BackgroundTransparency = 1
		self.ImageLabel.Position = UDim2.fromScale(0.042, 0.2)
		self.ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		self.ImageLabel.ClipsDescendants = false
		self.ImageLabel.BorderSizePixel = 0
		self.ImageLabel.Size = UDim2.fromOffset(100, 100)
		self.ImageLabel.Looped = true
		self.ImageLabel:Play()
	else
		self.ImageLabel = Instance.new('ImageLabel', gui) 
		self.ImageLabel.Name = randomString()
		self.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		self.ImageLabel.Image = image or 'rbxasset://textures/ui/GuiImagePlaceholder.png'
		self.ImageLabel.BackgroundTransparency = 1
		self.ImageLabel.Position = UDim2.fromScale(0.042, 0.2)
		self.ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		self.ImageLabel.ClipsDescendants = false
		self.ImageLabel.ScaleType = Enum.ScaleType.Fit
		self.ImageLabel.BorderSizePixel = 0
		self.ImageLabel.Size = UDim2.fromOffset(100, 100)
	end

	function mainapi:setImage(image)
		if isfile(image) then
			if image:find('.webm') then
				if self.ImageLabel:IsA('ImageLabel') then
					self.ImageLabel:Destroy()
					self.ImageLabel = Instance.new('VideoFrame', gui)
					self.ImageLabel.Name = randomString()
					self.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					self.ImageLabel.Video = image
					self.ImageLabel.BackgroundTransparency = 1
					self.ImageLabel.Position = UDim2.fromScale(0.042, 0.2)
					self.ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
					self.ImageLabel.ClipsDescendants = false
					self.ImageLabel.BorderSizePixel = 0
					self.ImageLabel.Size = UDim2.fromOffset(100, 100)
					self.ImageLabel.Looped = true
					self.ImageLabel:Play()
				else
					self.ImageLabel.Video = image
				end
			else
				if self.ImageLabel:IsA('VideoFrame') then
					self.ImageLabel:Destroy()
					self.ImageLabel = Instance.new('ImageLabel', gui) 
					self.ImageLabel.Name = randomString()
					self.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					self.ImageLabel.Image = image or 'rbxasset://textures/ui/GuiImagePlaceholder.png'
					self.ImageLabel.BackgroundTransparency = 1
					self.ImageLabel.Position = UDim2.fromScale(0.042, 0.2)
					self.ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
					self.ImageLabel.ClipsDescendants = false
					self.ImageLabel.ScaleType = Enum.ScaleType.Fit
					self.ImageLabel.BorderSizePixel = 0
					self.ImageLabel.Size = UDim2.fromOffset(100, 100)
				else
					self.ImageFrame.Image = image
				end
			end
		else
			if self.ImageLabel:IsA('ImageLabel') then
				self.ImageLabel.Image = image
			else
				self.ImageLabel.Video = image
			end
		end
	end

	function mainapi:Resize(size)
		self.ImageLabel.Size = size
	end

	function mainapi:changePosition(pos)
		self.ImageLabel.Position = pos
	end

	function mainapi:Shutdown()
		self.screenGui:Destroy()

		shared.mainapi = nil
	end
end

return mainapi