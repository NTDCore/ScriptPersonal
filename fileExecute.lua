local loadfile = loadfile or function(file)
	return loadstring(readfile(file))
end
local fileName = 'executefile.lua'
writefile(fileName, '')
local fileCode = readfile(fileName)
shared.FileExecute = true
task.spawn(function()
	repeat
		if not shared.FileExecute then
			break
		end
		task.wait()
		if not readfile(fileName)== fileCode then
			fileCode = readfile(fileName)
			loadfile(fileName)()
		end
	until false
end)