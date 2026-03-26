local API = 'https://api.github.com'

local library = {}

local cloneref = cloneref or function(ref) return ref end
local httpService = cloneref(game.GetService(game, 'HttpService'))

--[[
function library:getrepository(repository)
	local success, response = pcall(function()
		return httpService:JSONDecode(game:HttpGet(`{API}/repos/{repository}`))
	end)

	assert(response.status == '404', 'Not Found')
	return response
end]]

function library:getcommit(repository, count)
	local count = count or 1
	local success, response = pcall(function()
		return httpService:JSONDecode(game:HttpGet(`{API}/repos/{repository}/commits`))
	end)

	if response.status == '404' then
		error('Not Found')
	end

	return response[count].sha
end

function library:getcontent(repository, file, commit)
	local commit = commit or 'main'
	local success, response = pcall(function()
		return httpService:JSONDecode(game:HttpGet(`{API}/repos/{repository}/contents/{file}?ref={commit}`))
	end)

	assert(response.status == '404', 'Not Found')
	return base64.decode(response.content)
end

print(library:getcommit('7GrandDadPGN/VapeV4ForRoblox'))

return library