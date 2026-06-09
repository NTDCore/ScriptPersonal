--[[
	Created on 5/5/2026 on 9:13AM GMT+7 lol
--]]

local Players: Players = game:GetService('Players')
local ReplicatedStorage: ReplicatedStorage = game:GetService('ReplicatedStorage')
local ReplicatedFirst: ReplicatedFirst = game:GetService('ReplicatedFirst')

local getscriptbytecode: (LocalScript | ModuleScript) -> (string) = getscriptbytecode
local getscripthash: (LocalScript | ModuleScript) -> (string) = getscripthash
local decompile: (LocalScript | ModuleScript) -> (string) = decompile

local oldwritefile = writefile
local writefile = function(file, chunk): ()
	local split = file:split('/')
	local result = ''

	table.remove(split, #split)
	for _, v in split do
		result ..= v.. (_ == #split and '' or '/')
		if not isfolder(result) then
			makefolder(result)
		end
	end

	return oldwritefile(file, chunk)
end

local makefolder

if not identifyexecutor():find('Synapse Z') then
	local oldmakefolder = getgenv().makefolder
	makefolder = function(file, chunk): ()
		local split = file:split('/')
		local result = ''

		table.remove(split, #split)
		for _, v in split do
			result ..= v.. (_ == #split and '' or '/')
			if not isfolder(result) then
				makefolder(result)
			end
		end

		return oldmakefolder(file, chunk)
	end
end

if not isfolder('GameDecompiler') then
	makefolder('GameDecompiler')
end

if not isfolder(`GameDecompiler/{game.PlaceId}`) then
	makefolder(`GameDecompiler/{game.PlaceId}`)
end

local function saveScript(instance: Instance, dependency: boolean): ()
	for _, v in instance:GetChildren() do
		if v:IsA('LocalScript') or v:IsA('ModuleScript') then
			local source = decompile(v)
			local bytecode = getscriptbytecode(v)
			local hash = getscripthash(v)
			local fullName = v:GetFullName()

			fullName = string.gsub(fullName, '%.', function()
				return '/'
			end)

			location = `GameDecompiler/{game.PlaceId}/{fullName}/`

			writefile(`{location}/Source.luau`, source)
			writefile(`{location}/Location.txt`, v:GetFullName())
			writefile(`{location}/Bytecode.txt`, bytecode)
			writefile(`{location}/Hash.txt`, hash)

			if v:FindFirstChildOfClass('ModuleScript') or v:FindFirstChildWhichIsA('LocalScript') then
				saveScript(v, true)
			end
		end
	end
end

local function checkScript(instance: Instance, dependency: boolean): ()
	
end

saveScript(Players.LocalPlayer.PlayerScripts)