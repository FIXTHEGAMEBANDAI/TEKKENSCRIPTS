-- if not CharacterID Exit Script
if isNotCharacter(33) then
    return
end
local sdk2 = require("_SDK.sdk2")
local stage = require("_SDK.stage")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken EDBY","\xef\x93\x9a")
local outModule = {}

local config = {

}
local AutoCombo72DmgFlag = false
local AutoCombo71DmgFlag = false
local AutoCombo82DmgFlag = false

function COMBO_72()
DisableKeyboardInput()
delayFrames(30)
executeMacro(enums.Input.BACK,0,6,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.BACK,enums.Input.L_KICK,8,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.BACK,0,5,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.BACK,enums.Input.L_KICK,5,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.BACK,0,5,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.L_KICK,5,enums.InputType.KEY_PRESS)
delayFrames(5)
	executeMacro(enums.Input.UP+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(30)
	if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
		EnableKeyboardInput()
		return
	end
	executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(45)
	executeMacro(enums.Input.BACK,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(2)
	executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(35)
	if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
		EnableKeyboardInput()
		return
	end
	executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(10)
	executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(55)
	if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
		EnableKeyboardInput()
		return
	end
	executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	executeMacro(enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(5)
	executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(50)
	executeMacro(enums.Input.DOWN+enums.Input.BACK,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
	delayFrames(5)
	executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
	executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function COMBO_71()
DisableKeyboardInput()
if AutoCombo71DmgFlag then
delayFrames(25)
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.FORWARD + enums.Input.UP ,enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
delayFrames(55)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
end
executeMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
delayFrames(20)
executeMacro(enums.Input.BACK,0,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.BACK,enums.Input.L_KICK,5,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.L_KICK,5,enums.InputType.KEY_PRESS)
delayFrames(48)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_HAND,3,enums.InputType.KEY_PRESS)
--kick
delayFrames(30)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN,0,2,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,3,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,enums.Input.L_KICK,5,enums.InputType.KEY_PRESS)
--dash
delayFrames(40)
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.FORWARD + enums.Input.UP,enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
delayFrames(50)
--Roll and kick
executeMacro(0,enums.Input.L_KICK,3,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.L_KICK,5,enums.InputType.KEY_PRESS)
EnableKeyboardInput()
end

function COMBO_82()
DisableKeyboardInput()
delayFrames(35)
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.FORWARD + enums.Input.UP ,enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
delayFrames(50)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.DOWN,0,5,enums.InputType.KEY_DOWN)
delayFrames(45)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
executeMacro(enums.Input.DOWN,0,5,enums.InputType.KEY_DOWN)
delayFrames(45)
executeMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
delayFrames(40)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_PRESS)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_PRESS)
delayFrames(50)
executeMacro(enums.Input.DOWN+enums.Input.BACK,enums.Input.R_KICK,1,enums.InputType.KEY_PRESS)
delayFrames(5)
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_PRESS)
EnableKeyboardInput()
end

function WaitingJuggled()
	for i = 0, 30 do
		local CharacterState = getCharacterState(0)
		if CharacterState.enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
			break
		else
			delayFrames(1)
		end
	end
end

myScript:onTick(function(self, enemy)
print(stage.wall_distance(),getStageId(),getLocalPosX(),getLocalPosY())
	if not utils.CanRun(self) then
		return
	end
	local AttackType = getOpponentLastAttackType()

	if self.Distance < 2000.00 then
		FrameAdvantage = getLocalFrameAdvantage()
		if isCounterAttackPossible(FrameAdvantage) then
			local autoRate = getRandomInt(0, 100)
			-- Not Use
			if config.CounterattackChance < autoRate or not config.useAutomaticCounterattack then
				return
			end
			if AttackType == 0 then
				AttackType = utils.GetEnemyAttackTypeNotZero()
			end
			local Delayed = enemy.EndFrame - enemy.MoveTimer
			print(utils.getAttackTypeString(AttackType),FrameAdvantage)
			if AttackType == enums.AttackType.HIGH then

			end
			if AttackType == enums.AttackType.MID then
				--OK
				if FrameAdvantage >= 20 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD,enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 19 then
					executeMacro(enums.Input.DOWN,0, 2, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD,0, 2, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD,enums.Input.L_KICK, 10, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD,enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 18 or FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(enums.Input.FORWARD + enums.Input.DOWN,enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					local randcombo = getRandomInt(0, 1)
					if not config.AutoCombo then
						return
					end
					WaitingJuggled()
					print("randcombo",randcombo)
					if randcombo == 0 then
						COMBO_71()
					else
						COMBO_72()
					end
					return
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 15 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
		end
	end

	if enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
		if AutoCombo72DmgFlag then
			AutoCombo72DmgFlag = false
			COMBO_72()
		end
		if AutoCombo71DmgFlag then
			AutoCombo71DmgFlag = false
			COMBO_71()
		end
		if AutoCombo82DmgFlag then
			AutoCombo82DmgFlag = false
			COMBO_82()
		end
	end

end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	if msg == 257 then
		if wParam == config.AutoCombo72DmgCode then
			AutoCombo72DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN,enums.Input.L_KICK+enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
			asyncDelayFrames(15)
			asyncExecuteMacro(0,enums.Input.L_KICK+enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
		end
		if wParam == config.AutoCombo71DmgCode then
			AutoCombo71DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN + enums.Input.BACK,0,10,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
		end
		if wParam == config.AutoCombo82DmgCode then
			AutoCombo82DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN + enums.Input.BACK,0,10,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
		end
	end
	
	-- msg = 256 input
	-- msg = 257 input up

    -- Process the msg, wParam, and lParam if necessary
    -- For example:
    --print("Message:", msg)
    --print("wParam:", wParam)
    --print("lParam:", lParam)

end)

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('EDBY Combo Test Script Demo')
    menu.sameLine()
    menu.help("This is a demo script for Tekken 8 automation.")

    -- Counterattack Options Configuration
    menu.text('Counterattack Options')
    menu.sameLine()
    menu.help("Enable automatic counterattacks with a configurable chance.")
    menu.separator()
    config.useAutomaticCounterattack = menu.checkbox("Automatic Counterattack", config.useAutomaticCounterattack)
    config.CounterattackChance = menu.sliderInt("Counterattack Chance (%)", config.CounterattackChance, 0, 100)
	
	menu.separator()
	
    menu.text('Combo')
    menu.sameLine()
    menu.help("Assign a key for one-click combos and select the combo type.")
	
    config.AutoCombo = menu.checkbox('Auto Combo', config.AutoCombo)
	config.AutoCombo72DmgCode = menu.keySelect('Auto Combo (72 Dmg) Key ', config.AutoCombo72DmgCode)
	menu.sameLine()
	config.AutoCombo71DmgCode = menu.keySelect('Auto Combo (71 Dmg) Key ', config.AutoCombo71DmgCode)
	menu.sameLine()
	config.AutoCombo82DmgCode = menu.keySelect('Auto Combo (82 Dmg) Key ', config.AutoCombo82DmgCode)
	
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end