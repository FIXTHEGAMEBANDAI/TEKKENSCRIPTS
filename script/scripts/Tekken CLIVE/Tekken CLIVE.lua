-- if not CharacterID Exit Script
if isNotCharacter(36) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken CLIVE","\xef\x84\xae")
local outModule = {}
local AutoCombo76DmgFlag = false

local config = {

}

myScript:onTick(function(self, enemy)
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
				if FrameAdvantage >= 19 then
					executeMacro(enums.Input.DOWN + enums.Input.BACK, enums.Input.L_HAND, 5, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 18 or FrameAdvantage == 17 or FrameAdvantage == 16 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 15 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
				end
				--OK
				if FrameAdvantage == 14 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 18 then
					executeMacro(0 , enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoCombo76DmgFlag = true
					return
				end
				--OK
				if FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				
			end
		end
	end

	if config.AutoCombo55Dmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
	
		local ActionTimer = self.Recovery- self.MoveTimer
		local isActionEnd = ActionTimer <= 1 and ActionTimer >= 0

		--Damge55
		if self.MoveID == 1757 and isActionEnd then
			executeMacro(enums.Input.FORWARD, enums.Input.R_HAND, 1, enums.InputType.KEY_PRESS)
			delayFrames(10)
			executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1612 and isActionEnd then
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			delayFrames(10)
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1640 and self.ComplexMoveState == 16 then
			executeMacro(0, enums.Input.L_HAND, 10, enums.InputType.KEY_PRESS)
		end
	end
	
	
	if config.AutoCombo76Dmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
		local ActionTimer = self.Recovery- self.MoveTimer
		local isActionEnd = ActionTimer <= 1 and ActionTimer >= 0
		if isActionEnd and AutoCombo76DmgFlag then
			executeMacro(enums.Input.BACK, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			delayFrames(45)
			executeMacro(enums.Input.BACK+enums.Input.DOWN, enums.Input.L_HAND + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_HAND + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			delayFrames(50)
			executeMacro(0, enums.Input.R_HAND, 10, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_HAND, 10, enums.InputType.KEY_PRESS)
			delayFrames(60)
			executeMacro(enums.Input.BACK, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
			executeMacro(enums.Input.FORWARD, 0, 5, enums.InputType.KEY_PRESS)
			AutoCombo76DmgFlag = false
		end

	end
	
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	-- msg = 256 input
	-- msg = 257 input up
	

	if msg == 257 then
		if wParam == config.AutoCombo55DmgCode then
			asyncExecuteMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_HAND, 1, enums.InputType.KEY_PRESS)
		end
		if wParam == config.AutoCombo76DmgCode then
			asyncExecuteMacro(enums.Input.DOWN, 0, 10, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, enums.Input.R_HAND, 1, enums.InputType.KEY_PRESS)
			AutoCombo76DmgFlag = true
		end
		if wParam == config.QuickSkillCode then
			asyncExecuteMacro(enums.Input.BACK, enums.Input.L_HAND + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
	end
	
    -- Process the msg, wParam, and lParam if necessary
    -- For example:
    --print("Message:", msg)
    --print("wParam:", wParam)
    --print("lParam:", lParam)

end)

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('CLIVE Combo Test Script Demo')
    menu.sameLine()
    menu.help("This is a demo script for Tekken 8 automation.")

    -- Counterattack Options Configuration
    menu.text('Counterattack Options')
    menu.sameLine()
    menu.help("Enable automatic counterattacks with a configurable chance.")
    menu.separator()
    config.useAutomaticCounterattack = menu.checkbox("Automatic Counterattack", config.useAutomaticCounterattack)
    config.CounterattackChance = menu.sliderInt("Counterattack Chance (%)", config.CounterattackChance, 0, 100)

    menu.text('Combo')
    menu.sameLine()
    menu.help("Assign a key for one-click combos and select the combo type.")
	
    config.AutoCombo55Dmg = menu.checkbox('Auto Combo (55 Dmg)', config.AutoCombo55Dmg)
	menu.sameLine()
    config.AutoCombo76Dmg = menu.checkbox('Auto Combo (76 Dmg)', config.AutoCombo76Dmg)

	config.AutoCombo55DmgCode = menu.keySelect('Auto Combo (55 Dmg) Key', config.AutoCombo55DmgCode)
	menu.sameLine()
	config.AutoCombo76DmgCode = menu.keySelect('Auto Combo (76 Dmg) Key', config.AutoCombo76DmgCode)
    menu.sameLine()
    -- One Click Combo Section

	config.QuickSkillCode = menu.keySelect('Quick Skill Key', config.QuickSkillCode)

	menu.separator()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")

	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end