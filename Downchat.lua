repeat task.wait() until game:IsLoaded()
local cloneref = cloneref or function(...) return ... end
local players = cloneref(game:GetService('Players'))
local lplr = players.LocalPlayer
local ChatFrame = lplr.PlayerGui.Chat.Frame
local resolution = workspace.CurrentCamera.ViewportSize
local Box = ChatFrame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

local inputService = cloneref(game:GetService('UserInputService'))
local chats = {
	size = UDim2.new(0, 577, 0, 273),
	position = UDim2.new(0, -7, 0, resolution.Y - 300)
}
local shiftheld
local pressed

ChatFrame.Size = chats.size
ChatFrame.Position = chats.position
ChatFrame.ChatBarParentFrame.Visible = false
ChatFrame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ScrollingEnabled = false

local connections = {}

table.insert(connections, workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(function()
	resolution = workspace.CurrentCamera.ViewportSize
	if not pressed then
		Position = chats.position
		ChatFrame.Size = chats.size
		ChatFrame.Position = Position
	end
end))

table.insert(connections, inputService.InputBegan:connect(function(key)
	if key.KeyCode == Enum.KeyCode.Slash and not inputService:GetFocusedTextBox() then
		if not pressed then
			pressed = true
			ChatFrame.Position = UDim2.new(0, 0, 0, 0)
			ChatFrame.Size = UDim2.new(0, resolution.X, 0, resolution.Y)
			ChatFrame.ChatBarParentFrame.Visible = true
			Box:CaptureFocus()
			task.wait()
			Box.Text = ''
		else
			if not inputService:GetFocusedTextBox() then
				pressed = false
				ChatFrame.ChatBarParentFrame.Visible = false
				ChatFrame.Size = chats.size
				ChatFrame.Position = chats.position
			end
		end
	elseif key.KeyCode == Enum.KeyCode.Return then
		if pressed then
			pressed = false
			ChatFrame.ChatBarParentFrame.Visible = false
			ChatFrame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ScrollingEnabled = false
			ChatFrame.Size = chats.size
			ChatFrame.Position = chats.position
		end
	end
end))