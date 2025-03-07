if identifyexecutor():find('Xeno') then
	getgenv().cloneref = nil
end
local cloneref = cloneref or function(...) return ... end
local gethui = gethui or function() return cloneref(game:GetService('CoreGui')) end
local players = cloneref(game:GetService('Players'))
local lplr = players.LocalPlayer
local uilib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NTDCore/ScriptPersonal/main/libs/test.luau', true), 'test')()
local synsaveinstance = loadstring(game:HttpGet('https://raw.githubusercontent.com/luau/SynSaveInstance/main/saveinstance.luau', true), 'saveinstance')()
uilib:Init('Synapse X Save Instance')
uilib:createlabel('Credit to phoriah')
uilib:createbutton('Save Instance', function()
	for i,v in lplr.PlayerGui:GetChildren() do
		if not cloneref(game:GetService('StarterGui'))[v.Name] then
			local ok = v:Clone()
			ok.Parent = cloneref(game:GetService('StarterGui'))
		end
	end
	synsaveinstance({
		SaveBytecode = false,
		ShowStatus = true,
		IgnoreDefaultPlayerScripts = true,
		NilInstancesFixes = {
			BaseWrap = nil,
			Animator = nil,
			Attachment = nil,
			PackageLink = nil,
			AdPortal = nil
		},
		IgnoreList = { 'CoreGui', 'CorePackages' },
		__DEBUG_MODE = false,
		DecompileJobless = false,
		IgnoreNotArchivable = true,
		RemovePlayerCharacters = true,
		Object = false,
		DecompileIgnore = { 'TextChatService', nil, nil },
		IgnoreSpecialProperties = true,
		TreatUnionsAsParts = true,
		IsModel = false,
		NilInstances = false,
		ExtraInstances = { },
		noscripts = false,
		ReadMe = true,
		scriptcache = true,
		OptionsAliases = {
			IgnoreArchivable = 'IgnoreNotArchivable',
			DecompileTimeout = 'timeout',
			SaveNonCreatable = 'SaveNotCreatable',
			SavePlayers = 'IsolatePlayers',
			FileName = 'FilePath',
			IgnoreDefaultProps = 'IgnoreDefaultProperties'
		},
		AlternativeWritefile = true,
		mode = 'optimized',
		SaveCacheInterval = 56320,
		SharedStringOverwrite = false,
		IsolatePlayers = false,
		IgnoreSharedStrings = true,
		timeout = -1,
		NotCreatableFixes = { '', 'AnimationTrack', 'Player', 'PlayerGui', 'PlayerScripts', 'PlayerMouse', 'ScreenshotHud', 'StudioData', 'TextSource', 'TouchTransmitter' },
		Anonymous = false,
		IgnoreDefaultProperties = true,
		IsolateStarterPlayer = false,
		IgnorePropertiesOfNotScriptsOnScriptsMode = false,
		IsolateLocalPlayerCharacter = false,
		SaveNotCreatable = false,
		IsolateLocalPlayer = false,
		FilePath = false,
		AntiIdle = true,
		ShutdownWhenDone = false,
		SafeMode = false,
		IgnoreProperties = {}
	})
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
	IsolateLocalPlayer = false, --	#service.StarterGui:GetChildren() == 0
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