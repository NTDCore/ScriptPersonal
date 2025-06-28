local gameEvents = setmetatable({}, {
	__index = function(self, idx)
		self[idx] = Instance.new('BindableEvent')
		return self[idx]
	end
})

local cloneref = cloneref or function(...) return ... end
local service = setmetatable({}, {
	__index = function(self, idx)
		self[idx] = cloneref(game:GetService(idx))
		return self[idx]
	end
})

local collectionService = service.CollectionService
local replicatedStorage = service.ReplicatedStorage
local replicatedFirst = service.ReplicatedFirst
local inputService = service.UserInputService
local tweenService = service.TweenService
local runService = service.RunService
local guiService = service.GuiService
local players = service.Players
local coreGui = service.CoreGui

local gameCamera = workspace.CurrentCamera
local lplr = players.LocalPlayer

local hookmetamethod = hookmetamethod
local hookfunction = hookfunction
local getgc = getgc
local newcclosure = newcclosure