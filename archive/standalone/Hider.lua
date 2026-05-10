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
for i,v in players:GetPlayers() do
	table.insert(playerstable, v)
	for i2,v2 in playerstable do
		if v2 == lplr then
			table.remove(playerstable, i2)
		end
	end
end

players.PlayerAdded:Connect(function(plr)
	table.insert(playerstable, plr)
	for i,v in playerstable do
		v.Name = hiderdata['Everyone']['Name']
		v.DisplayName = hiderdata['Everyone']['DisplayName']
	end
end)

players.PlayerRemoving:Connect(function(plr)
	for i,v in playerstable do
		if v == plr then
			table.remove(playerstable, i)
		end
	end
end)

lplr.Name = hiderdata['Yourself']['Name']
lplr.DisplayName = hiderdata['Yourself']['DisplayName']

for i,v in pairs(playerstable) do
	v.Name = hiderdata['Everyone']['Name']
	v.DisplayName = hiderdata['Everyone']['DisplayName']
end