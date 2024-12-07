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
	checkMessage = 'hi me uzin efpee"ee" client',
	announcements = {
		message = '',
		duration = 1,
		targets = 'Roblox,Hi'
	}
}

return game.HttpService:JSONEncode(data)