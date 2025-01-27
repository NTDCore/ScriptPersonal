-- https://docs.weao.xyz/weao-api-reference/api-route-documentation
-- https://docs.weao.xyz/weao-api-reference/exploit-developer-api-route-documentation
local whatexpsareonline = {}

local cloneref = cloneref or function(...) return ... end
local httpService = cloneref(game:GetService('HttpService'))

local requests = syn and syn.request or fluxus and fluxus.request or krnl and krnl.request or http and http.request or request or function(req)
	if string.upper(req['Method']) == 'GET' then
		return {
			Body = game:HttpGet(req['Url']),
			Headers = {},
			StatusCode = 200
		}
	end
	return {
		Body = '404: Bad Exploit',
		Headers = {},
		StatusCode = 404
	}
end

do
	function whatexpsareonline:get(route)
		local routers = {
			'status/exploits',
			'versions/android',
			'versions/future',
			'versions/current'
		}
		local success, response = pcall(function()
			for i,v in routers do
				if string.find(route, v) then
					return requests({
						Url = 'https://whatexpsare.online/api/'..routes,
						Method = 'GET',
						Headers = {
							['Content-Type'] = 'application/json'
						}
					})
				end
			end
		end)
		return response
	end
	function whatexpsareonline:post(route, req)
		local routers = {
			'status/update'
		}
		local success, response = pcall(function()
			for i,v in routers do
				if string.find(route, v) then
					return requests({
						Url = 'https://whatexpsare.online/api/'..routes,
						Method = 'POST',
						Headers = {
							['Content-Type'] = 'application/json'
						},
						Body = httpService:JSONEncode(req)
					})
				end
			end
		end)
		return response
	end
	function whatexpsareonline:isdetected(exploit)
		local data = httpService:JSONDecode(self:get('status/exploits/'..exploit))
		if data.detected then
			return true
		end
		return false
	end
	function whatexpsareonline:free(exploit)
		local data = httpService:JSONDecode(self:get('status/exploits/'..exploit))
		if data.free then
			return true
		end
		return false
	end
end

return whatexpsareonline