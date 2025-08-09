local function test(func)
	local success, response = pcall(func)

	if not success then
		error('Failed function: ' .. tostring(func) .. ' (' .. identifyexecutor() .. ')\n\nError Info: ' .. response)
	end
end

test(function()
	local __test = {locked = true}
	table.freeze(__test)
	setreadonly(__test, false)
	assert(not table.isfrozen(__test), 'Failed to unfreeze the table. (imagine fake setreadonly lol)')
end)
assert(getrawmetatable, 'Missing function: getrawmetable (' .. identifyexecutor() .. ')')

local isreadonly = isreadonly or table.isfrozen
local writeable = function(t, b)
	if setreadonly then
		setreadonly(t, b or not isreadonly(t))
	end
end

local vuln = {
	__locked = isreadonly(getgenv())
}

function vuln.hook(idx, method, func)
	local __mt = getrawmetatable(idx)
	local old = __mt[method]

	if hookfunction then
		return hookfunction(__mt[method], func)
	else
		writeable(getrawmetatable(idx))
		__mt[method] = func
		writeable(getrawmetatable(idx))
	end

	return old
end

print('Loaded')

if vuln.__locked then
	writeable(getgenv())
end

getgenv().hookmetamethod = vuln.hook

if vuln.__locked then
	writeable(getgenv())
end

return vuln