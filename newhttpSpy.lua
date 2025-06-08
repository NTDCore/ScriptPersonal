repeat task.wait() until game:IsLoaded()

local httpSpy = shared.httpSpy or {
	antikick = true,
	awpexitscammed = true,
	blacklist = { 'grabify', 'ip-api', 'httpbin.org/ip' },
	console = false,

	disablehttpget = false,
	disablerequest = false,

	fileName = os.date('%d-%m-%Y-%X'):gsub(':', '.'),
	makeFile = true,
	['if you seeing this, you\'re gay (hyper ultra premium pro++++++)'] = {},

	notification = true
}
local httpmethods = { 'HttpGet', 'HttpGetAsync' }

local hookfunction = hookfunction
local hookmetamethod = hookmetamethod
local setreadonly = setreadonly
local checkcaller = checkcaller or function() return true end
local isfolder = isfolder
local makefolder = makefolder
local isfile = isfile
local writefile = writefile
local appendfile = appendfile

local cloneref = cloneref or function(...) return ... end
local service = setmetatable({}, {
	__index = function(self, idx)
		self[idx] = cloneref(game:GetService(idx))
		return self[idx]
	end
})

local players = service.Players
local httpService = service.HttpService
local starterGui = service.StarterGui
local testService = service.TestService

local lplr = players.LocalPlayer

if not isfolder('scriptpersonal') then
	makefolder('scriptpersonal')
	makefolder('scriptpersonal/httpSpy')
end

local function detected(content)
	if httpSpy.makeFile then
		if not isfile('scriptpersonal/httpSpy/' .. httpSpy.fileName .. '.txt') then
			writefile('scriptpersonal/httpSpy/' .. httpSpy.fileName .. '.txt', '[HTTPSPY]: logging started:\n\n' .. content .. '\n')
		else
			appendfile('scriptpersonal/httpSpy/' .. httpSpy.fileName .. '.txt', content .. '\n')
		end
	end

	if httpSpy.notification then
		starterGui:SetCore('SendNotification', {
			Title = 'HTTPSPY',
			Text = content,
			Duration = 10
		})
	end

	if httpSpy.console then
		if rconsolecreate then
			rconsolecreate()	
			rconsoleprint(content .. '\n')
		else
			testService:Message(content)
		end
	end
end

local httplog
local requestlog
local antikick

httplog = hookmetamethod(game, '__namecall', newcclosure(function(self, url, ...)
	if table.find(httpmethods, getnamecallmethod()) then
		detected('[ ' .. string.upper(getnamecallmethod()) .. ' ]: ' .. url) -- [ HTTPGET ]: https://rule34.xxx/

		if table.find(httpSpy.blacklist, url) then
			return nil
		end

		if httpSpy.disablehttpget then
			return nil
		end
	end

	return httplog(self, url, ...)
end))

requestlog = hookfunction(request, newcclosure(function(data)
	detected('[ REQUEST : ' .. string.upper(data.Method) .. ' ]: ' .. data.Url) -- [ REQUEST : GET ]: https://rule34.xxx/

	if table.find(httpSpy.blacklist, data.Url) then
		return nil
	end

	if httpSpy.disablerequest then
		return nil
	end

	return requestlog(data)
end))

if httpSpy.antikick then
	antikick = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
		if checkcaller() == true and getnamecallmethod():lower() == 'kick' and self == lplr or getnamecallmethod():lower() == 'shutdown' then
			starterGui:SetCore('SendNotification', {
				Title = 'HTTPSPY : ANTIKICK',
				Text = 'Script attempted to ' .. getnamecallmethod(),
				Duration = 10
			})

			return nil
		end

		return antikick(self, ...)
	end))
end

return httpSpy