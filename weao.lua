-- https://docs.weao.xyz/weao-api-reference/api-route-documentation
-- https://docs.weao.xyz/weao-api-reference/exploit-developer-api-route-documentation

local cloneref = cloneref or function(...) return ... end
local httpService = cloneref(game:GetService('HttpService'))
local requests = syn and syn.request or fluxus and fluxus.request or krnl and krnl.request or http and http.request or request
local whatexpsareonline = {}

do
	function whatexpsareonline:get(route): table
		return requests({
			Url = 'https://whatexpsare.online/api/'..route,
			Method = 'GET',
			Headers = {
				['Content-Type'] = 'application/json'
			}
		})
	end
	function whatexpsareonline:isdetected(exploit): boolean
		local data = httpService:JSONDecode(self:get('status/exploits/'..exploit))
		if data.detected then
			return true
		end
		return false
	end
end

return whatexpsareonline