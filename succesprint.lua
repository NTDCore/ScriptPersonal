local cloneref = cloneref or function(...) return ... end
local coreGui = cloneref(game.GetService(game, 'CoreGui'))
local console = {}
local consoleUI = coreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI
consoleUI.ChildAdded:Connect(function(obj)
	if obj.Name == 'MainView' then
		local ClientLog = obj:WaitForChild('ClientLog', 9e9)
		ClientLog.ChildAdded:Connect(function(a)
			for i,v in a:GetChildren() do
				
			end
		end)
	end
end)
function console:printsuccess(text)
	print(text)
	table.insert(self, text..'-'..#self)
	task.wait(0.01)
	for i,v in consoleUI.MainView.ClientLog:GetChildren() do
		if v:IsA('Frame') and v.Name ~= 'WindowingPadding' then
			for i2,v2 in self do
				local splitted = v2:split('-')
				if v.msg.Text:find(splitted[1]) then
					v.msg.TextColor3 = Color3.fromRGB(0,255,0)
					v.image.Image = 'rbxasset://textures/AudioDiscovery/done.png'
				end
			end
		end
	end
end