-- credit to x2Neptune
-- the code is look bad so why not

local requests = http and http.request or http_request or request
local cloneref = cloneref or function(...) return ... end
local httpService = cloneref(game.GetService(game, 'HttpService'))
local teleportService = cloneref(game.GetService(game, 'TeleportService'))
local starterGui = cloneref(game.GetService(game, 'StarterGui'))
local lplr = cloneref(game.GetService(game, 'Players')).LocalPlayer
local serverList = {}
local req = requests({
	Url = 'https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true',
	Method = 'GET'
})
local body = httpService:JSONDecode(req.Body)
if body.StatusCode == 200 and body.data then
	for i, v in next, body.data do
		if type(v) == 'table' and v.playing and v.maxPlayers and v.playing < v.maxPlayers and v.id ~= game.JobId then
			table.insert(serverList, 1, v.id)
		end
	end
end
print(#serverList)
for i = 1, #serverList do
	starterGui:SetCore("SendNotification",{
		Title = 'ServerHop',
		Text = 'Joining...'
		Duration = 10
	})
	teleportService:TeleportToPlaceInstance(game.PlaceId, serverList[i], lplr)
end