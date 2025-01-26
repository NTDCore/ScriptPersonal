local v_ = {};
local getservice = function(self, ...)
	return game.GetService(self, ...);
end
local v_a = {game, 'Players'};
local v_request = http and http.request or request or function(v1)
	if v1.Method == 'GET' then
		return {
			Body = game.HttpGet(game, v1.Url)
		}
	end
	return {Body = ''};
end
local v_Players = getservice(v_a[1], v_a[2]);
local v_LocalPlayer = v_Players.LocalPlayer;
local v_Character = v_LocalPlayer:WaitForChild('Character');
v_.isAlive = function(v1, v2);
	v1 = v1 or v_LocalPlayer
	local v_ent = v1.Parent ~= 'Players' and v1 or v1:WaitForChild('Character')
	if v_ent:WaitForChild('Humanoid') and v_ent.Humanoid.Health > 1 then
		return true;
	end
	return false;
end
v_.getClientVersion = function()
	return version();
end
v_.getServerVersion = function()
	local v_getVersion = getservice(game, 'HttpService'):JSONDecode(v_request({Url = 'https://clientsettings.roblox.com/v2/client-version/WindowsPlayer/channel/live', Method = 'GET'}).Body);
	return v_getVersion.version;
end
v_.isOutdate = function()
	local v_client = v_.getClientVersion();
	local v_server = v_.getServerVersion();
	if not string.match(v_client, v_server) then
		return true;
	end
	return false;
end

return v_;