local mainapi = {}

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

function mainapi.new()
	mainapi.ImageLabel = Instance.new('ImageLabel', gui) 
	mainapi.Name = randomString()
	mainapi.ImageLabel.Active = false
	mainapi.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	mainapi.ImageLabel.Image = 'rbxasset://textures/ui/GuiImagePlaceholder.png'
	mainapi.ImageLabel.BackgroundTransparency = 1
	mainapi.ImageLabel.Position = UDim2.fromScale(0.042, 0.2)
	mainapi.ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	mainapi.ImageLabel.ClipsDescendants = false
	mainapi.ImageLabel.BorderSizePixel = 0
	mainapi.ImageLabel.Size = UDim2.fromOffset(100, 100)

	function mainapi:setImage(image)
		if isfile(image) and table.find({'.jpeg', '.png', '.webm'}, image) then
			self.ImageLabel.Image = getcustomasset(image)
		else
			self.ImageLabel.Image = image
		end
	end

	function mainapi:Resize(size)
		mainapi.ImageLabel.Size = size
	end
end

return mainapi