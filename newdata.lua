local cloneref = cloneref or function(...) return ... end
local players = cloneref(game.GetService(game, 'Players'))
local lplr = players.LocalPlayer
local data = {
	WhitelistedUsers = {
		[7326750145] = { -- monia
			TagText = 'Script Developer',
			TagColor = Color3.fromRGB(255,95,95),
			Rank = 3
		},
		[4520166929] = { -- monia
			TagText = 'Script Developer',
			TagColor = Color3.fromRGB(255,95,95),
			Rank = 3
		},
		[7194695315] = { -- max
			TagText = 'Script Developer',
			TagColor = Color3.fromRGB(255,95,95),
			Rank = 3
		},
		[2012715343] = { -- monia
			TagText = 'Script Developer',
			TagColor = Color3.fromRGB(255,95,95),
			Rank = 3
		},
		[2984841826] = { -- king
			TagText = [[Mikex's child]],
			TagColor = Color3.fromRGB(0,255,0),
			Rank = 3
		},
		[529431696] = { -- Fizz
			TagText = 'Fizz, my beloved ❤️',
			TagColor = Color3.fromRGB(255,0,255),
			Rank = 3
		},
		[3054176102] = { -- Dustin Jester
			TagText = 'Content Creator',
			TagColor = Color3.fromRGB(255,255,0),
			Rank = 3
		},
		[548164386] = { -- Mikex
			TagText = 'Content Creator',
			TagColor = Color3.fromRGB(255,255,0),
			Rank = 3
		}
	},
	customtags = {},
	localprio = 1,
	lpn = 'default',
	prios = {
		default = 1,
		private = 2,
		host = 3
	},
	checkMessage = 'hi me le uzin fapee"ee" client',
	announcements = {
		message = '',
		from = '',
		duration = 1,
		target = 'Roblox,Hi'
	}
}

data.getRank = function(plr)
	if data.WhitelistedUsers[plr.UserId] then
		return data.WhitelistedUsers[plr.UserId].Rank
	end
	return 1
end

data.getPlayer = function(a)
	if a == 'default' and data.localprio == 1 then
		return true
	end
	if a == 'private' and data.localprio == 2 then
		return true
	end
	return false
end

data.getPriority = function()
	if data.localprio >= 1 and data.localprio == 2 then
		return 'Private'
	end
	if data.localprio >= 1 and data.localprio == 3 then
		return 'Host'
	end
	return nil
end

data.getWhitelist = function(plr)
	local rank = data.getRank(plr)
	if rank >= data.localprio then
		return true
	end
	return false
end

data.getCurrentRank = function()
	if data.WhitelistedUsers[lplr.UserId] then
		data.localprio = data.WhitelistedUsers[lplr.UserId].Rank
	end
end

return data