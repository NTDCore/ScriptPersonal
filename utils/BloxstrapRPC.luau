local cloneref = cloneref or function(...) return ... end
local httpService = cloneref(game.GetService(game, 'HttpService'))

local BloxstrapRPC = {
	Init = false
}

export type RichPresence = {
	details: string?,
	state: string?,
	timeStart: number?,
	timeEnd: number?,
	smallImage: RichPresenceImage?,
	largeImage: RichPresenceImage?
}

export type RichPresenceImage = {
	assetId: number?,
	hoverText: string?,
	clear: boolean?,
	reset: boolean?
}

function BloxstrapRPC:Init()
	if not self.Init then
		self.Init = true
		function self:SendMessage(command, data: any)
			local json = httpService:JSONEncode({
				command = command,
				data = data
			})

			print('[BloxstrapRPC] ' .. json)
		end

		function self:SetRichPresence(data: RichPresence)
			if data.timeStart ~= nil then
				data.timeStart = math.round(data.timeStart)
			end
			if data.timeEnd ~= nil then
				data.timeEnd = math.round(data.timeEnd)
			end

			self:SendMessage('SetRichPresence', data)
		end
	end
end

return BloxstrapRPC