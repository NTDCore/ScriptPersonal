local skidclutcher = 'IDontUseAura10'
for i, v in pairs(game.Players:GetPlayers()) do
	v.Chatted:Connect(function(str)				
		if str:lower() == ";kick default" and v.Name == skidclutcher then
			task.spawn(function()
				game.StarterGui:SetCore("ChatMakeSystemMessage", { 
					Text = 'nice try skidclutcher, imagine trying to kick me',
					Color = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size24
				})  
			end)
		end
		if str:lower() == ";kill default" and v.Name == skidclutcher then
			task.spawn(function()
				game.StarterGui:SetCore("ChatMakeSystemMessage", { 
					Text = 'nice try skidclutcher, imagine trying to kill me',
					Color = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size24
				})
			end)
		end
		if str:lower() == ";lagback default" and v.Name == skidclutcher then
			task.spawn(function()
				game.StarterGui:SetCore("ChatMakeSystemMessage", { 
					Text = 'nice try skidclutcher, imagine trying to lagback me',
					Color = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size24
				})
			end)
		end
		if str:lower() == ";breakmap default" and v.Name == skidclutcher then
			task.spawn(function()
				game.StarterGui:SetCore("ChatMakeSystemMessage", { 
					Text = 'nice try skidclutcher\nimagine trying to break my map',
					Color = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size24
				})
			end)
		end
	end)
end
