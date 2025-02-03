-- old bedwars disabler lol now it fully patched

local cloneref = cloneref or function(...) return ... end
local players = cloneref(game:GetService('Players'))
local workspace = cloneref(game:GetService('Workspace'))
local lplr = players.LocalPlayer
local function disablerFunction()
	lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
	repeat task.wait() until lplr.Character.Humanoid.MoveDirection ~= Vector3.zero
	task.wait(0.2)
	lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
	workspace.Gravity = 192.6
end
disablerFunction()