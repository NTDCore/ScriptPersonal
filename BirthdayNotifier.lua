-- making this while bored + feeling something kinda weird
-- recommended put this in autoexec

local birthday = {List = {}}

local cloneref = cloneref or function(reference) return reference end

local writefile = writefile or function(file, src) end
local readfile = readfile or function(file) end
local getcustomasset = getcustomasset or function(asset)
	return 'rbxasset://'..asset
end
local loadfile = loadfile or function(file)
	return loadstring(readfile(file), true)
end

if not isfile('birthdaylist.json') then
	writefile('birthdaylist.json', '[]')
end

local lplr = cloneref(game:GetService('Players')).LocalPlayer
local startergui = cloneref(game:GetService('StarterGui'))
local httpService = cloneref(game:GetService('HttpService'))
local soundService = cloneref(game:GetService('SoundService'))

if isfile('birthdaylist.json') and readfile('birthdaylist.json') ~= '[]' then
	birthday.List = httpService:JSONDecode(readfile('birthdaylist.json'))
end

function birthday:addList(name, date)
	table.insert(self.List, {
		Name = name,
		Date = date
	})
	-- table.foreach(self.List, print)
end

function birthday:removeList(name)
	for i,v in self.List do
		if v.Name == name then
			table.remove(self.List, i)
			table.foreach(self.List, print)
		end
	end
end

function birthday:showList()
	print('\n\n			[=============== BIRTHDAY LIST ===============]')
	for i,v in self.List do
		if type(v) == 'table' then
			for _, data in v do
				print(_..': '..data)
			end
		end
	end
end

function birthday:Save()
	writefile('birthdaylist.json', httpService:JSONEncode(self.List))
end

for i,v in birthday.List do
	if os.date('%m %d') == v.Date then
		startergui:SetCore('SendNotification', {
			Title = 'Birthday Notifier',
			Text = 'Today, it\'s '..v.Name..'\'s Birthday!',
			Duration = 60
		})
	end
end

return birthday