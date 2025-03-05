if identifyexecutor():find('Xeno') then
	getgenv().cloneref = nil
end
local cloneref = cloneref or function(...) return ... end
local EXECUTOR_NAME = {identifyexecutor()}[1]
local gethui = gethui or function() return cloneref(game:GetService('CoreGui'))
local uilib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NTDCore/ScriptPersonal/main/libs/test.luau', true), 'test')()
local synsaveinstance = loadstring(game:HttpGet('https://raw.githubusercontent.com/luau/SynSaveInstance/main/saveinstance.luau', true), 'saveinstance')()
uilib:Init('Synapse X Save Instance')
uilib:createbutton('Save Instance', function()
	synsaveinstance()
end)
--[[
local Options = {
	mode = 'optimized',
	noscripts = false,
	scriptcache = true,
	-- decomptype = '',
	timeout = 10,
	-- * New:
	__DEBUG_MODE = false,
	DecompileJobless = false,
	DecompileIgnore = { -- * Clean these up (merged Old Syn and New Syn)
		-- 'Chat',
		'TextChatService',
		ModuleScript = nil,
	},
	IgnoreDefaultPlayerScripts = EXECUTOR_NAME ~= 'Wave' and true,
	SaveBytecode = false,
	IgnoreProperties = {},
	IgnoreList = { 'CoreGui', 'CorePackages' },
	ExtraInstances = {},
	NilInstances = false,
	NilInstancesFixes = {},
	ShowStatus = true,
	SafeMode = false,
	ShutdownWhenDone = false,
	AntiIdle = true,
	Anonymous = false,
	ReadMe = true,
	FilePath = false,
	Object = false,
	IsModel = false,
	IgnoreDefaultProperties = true,
	IgnoreNotArchivable = true,
	IgnorePropertiesOfNotScriptsOnScriptsMode = false,
	IgnoreSpecialProperties = ArrayToDict({ 'Fluxus', 'Delta', 'Solara' })[EXECUTOR_NAME] or false, -- ! Please submit more Executors that crash on gethiddenproperty (with this disabled basically)
	IsolateLocalPlayer = false, --  #service.StarterGui:GetChildren() == 0
	IsolateLocalPlayerCharacter = false,
	IsolatePlayers = false,
	IsolateStarterPlayer = false,
	RemovePlayerCharacters = true,
	SaveNotCreatable = false,
	NotCreatableFixes = {
		-- 'CloudLocalizationTable',
		-- 'InputObject',
		-- 'LodDataEntity',
		-- 'Path',
		-- 'Translator',
		'', -- * FilteredSelection
		'AnimationTrack',
		'Player',
		'PlayerGui',
		'PlayerScripts',
		'PlayerMouse',
		'ScreenshotHud',
		'StudioData',
		'TextSource',
		'TouchTransmitter',
	}
}
synsaveinstance(Options)
]]