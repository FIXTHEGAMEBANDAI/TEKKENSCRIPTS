local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu
local myScript = sdk2.Register:New("Guard","\xef\x86\xb3")
local outModule = {}
local autoBlockRate = getRandomInt(0, 100)
local config = {

}

function IsStartedBeingThrown(self)
	GameSnapshot = getCharacterState(2)
    if self.MoveID == GameSnapshot.self.MoveID then
        return false
    end
	return GameSnapshot.enemy.AttackType ~= enums.AttackType.THROW,GameSnapshot.enemy.Recovery - GameSnapshot.enemy.MoveTimer
end

function TechCombos(self, enemy,ThrownFramesCount)

    local autoRate = getRandomInt(0, 100)
    if config.throwBreakChance < autoRate then
        return
    end
	local DelayedPress =  getRandomInt(2, 3)
	delayFrames(DelayedPress)
	--Begin Thrown Get Now Snapshot ThrowTechType
	self = getCharacterState(0).self
	local Delayed = ThrownFramesCount - DelayedPress
    local randomPressDuration = getRandomInt(5, 10) -- Adjust the number of frames the throw break button is pressed 
	
    if self.ThrowTech == enums.ThrowType.TE1_2 then
        asyncDisableKeyboardInput()
		asyncExecuteMacro(0, enums.Input.L_HAND + enums.Input.R_HAND, randomPressDuration, enums.InputType.KEY_PRESS)
		asyncEnableKeyboardInput()
    elseif self.ThrowTech == enums.ThrowType.TE1 then
        asyncDisableKeyboardInput()
		asyncExecuteMacro(0, enums.Input.L_HAND, randomPressDuration, enums.InputType.KEY_PRESS)
		asyncEnableKeyboardInput()
    elseif self.ThrowTech == enums.ThrowType.TE2 then
        asyncDisableKeyboardInput()
		asyncExecuteMacro(0, enums.Input.R_HAND, randomPressDuration, enums.InputType.KEY_PRESS)
		asyncEnableKeyboardInput()
    end
end


myScript:onTick(function(self, enemy)
	--Auto Defend
	local IsBeingThrown,ThrownFramesCount = IsStartedBeingThrown(self)
    local isThrowing = (utils.IsAttackThrow(enemy) and IsBeingThrown)
    if isThrowing then
        TechCombos(self, enemy,ThrownFramesCount)
    elseif utils.IsAttackStarting(self) or isThrowing or utils.IsAttackUnblockable(enemy) then
        return
    end
	if self.Recovery - self.MoveTimer == 0 then
		autoBlockRate = getRandomInt(0, 100)
	end
	-- Get the number of frames until the opponent's attack impacts
	local frames = utils.GetTimeUntilImpact(enemy)

	local IsAttackStarting = utils.IsAttackStarting(enemy)
	local AttackType = getOpponentLastAttackType()
	if IsAttackStarting and frames > 0 and self.Distance < 2200.00 then
		local PressFrames = frames - 1
		--Auto Rage
		if AttackType ~= 0 and config.useAutoRage and self.IsRageStarte then
			asyncDisableKeyboardInput()
			asyncExecuteMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.L_HAND + enums.Input.R_HAND, PressFrames, enums.InputType.KEY_PRESS)
			asyncEnableKeyboardInput()
		end
		-- If the opponent's attack frames have elapsed (no impact)

		-- Proceed only if the opponent is within a reasonable Distance and the attack is imminent
		if AttackType == enums.AttackType.HIGH then
			-- Handle low attacks with the configured defense mechanism
			if config.duckChance >= autoBlockRate and config.useDuck and frames >= 10 and frames < 15 then
				-- duck whiff punish if the attack is still in early stages
				asyncDisableKeyboardInput()
				asyncExecuteMacro(enums.Input.BACK + enums.Input.DOWN , 0, PressFrames , enums.InputType.KEY_DOWN)
				asyncExecuteMacro(0, 0, 0 , enums.InputType.KEY_UP)
				asyncEnableKeyboardInput()
			elseif config.blockHighChance >= autoBlockRate and config.useAutoHighBlock then
				-- Block the high attack if whiff punish isn't triggered
				asyncDisableKeyboardInput()
				asyncExecuteMacro(enums.Input.BACK, 0, PressFrames , enums.InputType.KEY_DOWN)
				asyncExecuteMacro(0, 0, 0 , enums.InputType.KEY_UP)
				asyncEnableKeyboardInput()
			end
		elseif AttackType == enums.AttackType.LOW and config.useAutoLowBlock and config.blockLowChance >= autoBlockRate then
			-- Handle mid attacks with the chance of a block
			if config.blockLowType == 1 then
				asyncDisableKeyboardInput()
				asyncExecuteMacro(enums.Input.DOWN + enums.Input.FORWARD, 0, PressFrames , enums.InputType.KEY_DOWN)
				asyncExecuteMacro(0, 0, 0 , enums.InputType.KEY_UP)
				asyncEnableKeyboardInput()
			else
				asyncDisableKeyboardInput()
				asyncExecuteMacro(enums.Input.BACK + enums.Input.DOWN , 0, PressFrames , enums.InputType.KEY_DOWN)
				asyncExecuteMacro(0, 0, 0 , enums.InputType.KEY_UP)
				asyncEnableKeyboardInput()
			end
		elseif AttackType == enums.AttackType.MID and config.useAutoMidBlock and config.blockMidChance >= autoBlockRate then
			--print("enemy: Attacktype",enemy.AttackType)
			-- Block the mid attack
			asyncDisableKeyboardInput()
			asyncExecuteMacro(enums.Input.BACK, 0, PressFrames , enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0 , enums.InputType.KEY_UP)
			asyncEnableKeyboardInput()
		end
	end
end)


-- Window event
myScript:onMessage(function(msg, wParam, lParam)

--print("Message:", msg)
--print("wParam:", wParam)
--print("lParam:", lParam)

end)

myScript:onMenu(function()
    -- Auto Guard Configuration Section
    menu.text('Auto Guard Configuration')
    menu.sameLine()
    menu.help("Enable automatic blocking of high, mid, and low attacks with a specified probability.")
    
    config.useAutoHighBlock = menu.checkbox("Enable Auto Block High Attack", config.useAutoHighBlock)
    menu.sameLine()
    config.useAutoMidBlock = menu.checkbox("Enable Auto Block Mid Attack", config.useAutoMidBlock)
    menu.sameLine()
    config.useAutoLowBlock = menu.checkbox("Enable Auto Block Low Attack", config.useAutoLowBlock)
    menu.separator()

    -- Probability Options Section
    menu.text('Probability Options')
    menu.sameLine()
    menu.help("Set the probability of blocking high, mid, or low attacks when enabled.")
    
    config.blockHighChance = menu.sliderInt("Block High Chance (%)", config.blockHighChance, 0, 100)
    config.blockMidChance = menu.sliderInt("Block Mid Chance (%)", config.blockMidChance, 0, 100)
    config.blockLowChance = menu.sliderInt("Block Low Chance (%)", config.blockLowChance, 0, 100)
    config.blockLowType = menu.combo('Low Block Type', config.blockLowType, { "Only Use Block", "Use Low Parry" })
    -- Automatic Duck Whiff Punish Section
    menu.text('Automatically duck Options')
    menu.sameLine()
    menu.help("Automatically duck onfigurable chance.")
    menu.separator()
	config.useAutoRage = menu.checkbox("Auto UseRae", config.useAutoRage)
	menu.sameLine()
    config.useDuck = menu.checkbox("Enable Auto Duck", config.useDuck)

    config.duckChance = menu.sliderInt("Auto Duck Chance (%)", config.duckChance, 0, 100)

    menu.separator()
	-- Automatic Throw Break Section
	menu.text('Throw Break Options')
	menu.sameLine()
	menu.help("Automatically break throws with a configurable chance.")
	menu.separator()
	config.useAutoThrowBreak = menu.checkbox("Enable Auto Throw Break", config.useAutoThrowBreak)

	config.throwBreakChance = menu.sliderInt("Throw Break Chance (%)", config.throwBreakChance, 0, 100)

	menu.separator()
    -- Description Section
    menu.text("Some Introduction")
    menu.text("This automation script for Tekken 8 offers advanced features to help players manage defensive and offensive")
	menu.text("strategies through automated actions. The menu provides customizable options that can adjust the probability")
	menu.text("automatic blockingand punishment responses to specific attacks, alongside key bindings for combo execution. ")
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name) ---注册失败，尝试从已注册脚本中拉取
end