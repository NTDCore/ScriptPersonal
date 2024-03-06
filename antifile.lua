-- Working in Progress
local loadfilefunc = loadfile or function(file)
	return loadstring(readfile(file))()
end
local hookfuncs = hookfunc or hookfunction -- hookfunc is allias from krampus lol
local oldreadfile
local olddelfile
local olddelfolder
local oldisfile
oldreadfile = hookfuncs(readfile, newcclosure(function(file)
	if file:find('6872274481') then
		return 'here my source haha'
	end
	return oldreadfile(file)
end))

olddelfile = hookfuncs(delfile, newcclosure(function(file)
	if file:find('6872274481.lua') then
		return nil
	end
	return olddelfile(file)
end))

olddelfolder = hookfuncs(delfolder, newcclosure(function(file)
	if file:find('vape') or file:find('vapeprivate') then
		return nil
	end
	return olddelfolder(file)
end))

oldisfile = hookfuncs(isfile, newcclosure(function(file)
	if file:find('vapeprivate') or file:find('vape') then
		return nil
	end
	return oldisfile(file)
end))