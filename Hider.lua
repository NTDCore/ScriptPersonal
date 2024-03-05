-- i will say this shit is just name hider
local players = game.Players
local lplr = players.LocalPlayer
local hiderdata = {
	['Yourself'] = {
		['Name'] = '???',
		['DisplayName'] = '???'
	},
	['Everyone'] = {
		['Name'] = 'Name',
		['DisplayName'] = 'Name'
	}
}

local playerstable = {}
for i,v in pairs(players:GetPlayers()) do
	table.insert(playerstable, v)
	table.remove(playerstable, 1)
end

players.PlayerAdded:Connect(function(plr)
	table.insert(playerstable, plr)
	for i,v in pairs(playerstable) do
		v.Name = hiderdata['Everyone']['Name']
		v.DisplayName = hiderdata['Everyone']['DisplayName']
	end
end)

players.PlayerRemoving:Connect(function(plr)
	table.remove(playerstable, plr)
end)

lplr.Name = hiderdata['Yourself']['Name']
lplr.DisplayName = hiderdata['Yourself']['DisplayName']

for i,v in pairs(playerstable) do
	v.Name = hiderdata['Everyone']['Name']
	v.DisplayName = hiderdata['Everyone']['DisplayName']
end