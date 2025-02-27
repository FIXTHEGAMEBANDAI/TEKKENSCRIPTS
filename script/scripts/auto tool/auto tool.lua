local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu
local myScript = sdk2.Register:New("auto tool","\xef\x86\xb2")
local outModule = {}
local autoBlockRate = getRandomInt(0, 100)
local config = {

}
local recordData = {}
local isRecording = false
local lastInputDirection, lastInputAttack = 0, 0
local lastFrame, currentFrame = 0, 0
local autoPEWGFFlag = false
local comboCount = 0
local LastTimer = 0

function getInputDirectionCode(inputDirection)
    if inputDirection == enums.InputDirectionCodes.u then
        return enums.Input.UP
    elseif inputDirection == enums.InputDirectionCodes.f then
        return enums.Input.FORWARD
    elseif inputDirection == enums.InputDirectionCodes.d then
        return enums.Input.DOWN
    elseif inputDirection == enums.InputDirectionCodes.b then
        return enums.Input.BACK
    elseif inputDirection == enums.InputDirectionCodes.ub then
        return enums.Input.UP+enums.Input.BACK
    elseif inputDirection == enums.InputDirectionCodes.uf then
        return enums.Input.UP+enums.Input.FORWARD
    elseif inputDirection == enums.InputDirectionCodes.df then
        return enums.Input.DOWN+enums.Input.FORWARD
    elseif inputDirection == enums.InputDirectionCodes.db then
        return enums.Input.DOWN+enums.Input.BACK
    end
    return 0
end

function getInputDirectionString(inputDirection)
    if inputDirection == enums.InputDirectionCodes.u then
        return "enums.Input.UP"
    elseif inputDirection == enums.InputDirectionCodes.f then
        return "enums.Input.FORWARD"
    elseif inputDirection == enums.InputDirectionCodes.d then
        return "enums.Input.DOWN"
    elseif inputDirection == enums.InputDirectionCodes.b then
        return "enums.Input.BACK"
    elseif inputDirection == enums.InputDirectionCodes.ub then
        return "enums.Input.UP+enums.Input.BACK"
    elseif inputDirection == enums.InputDirectionCodes.uf then
        return "enums.Input.UP+enums.Input.FORWARD"
    elseif inputDirection == enums.InputDirectionCodes.df then
        return "enums.Input.DOWN+enums.Input.FORWARD"
    elseif inputDirection == enums.InputDirectionCodes.db then
        return "enums.Input.DOWN+enums.Input.BACK"
    end
    return "0"
end

function getInputAttackCode(inputAttack)
    if inputAttack == enums.InputAttackCodes.x1 then
        return enums.Input.L_HAND
    elseif inputAttack == enums.InputAttackCodes.x2 then
        return enums.Input.R_HAND
    elseif inputAttack == enums.InputAttackCodes.x3 then
        return enums.Input.L_KICK
    elseif inputAttack == enums.InputAttackCodes.x4 then
        return enums.Input.R_KICK
    -- 2
    elseif inputAttack == enums.InputAttackCodes.x1x2 then
        return enums.Input.L_HAND + enums.Input.R_HAND
    elseif inputAttack == enums.InputAttackCodes.x1x3 then
        return enums.Input.L_HAND + enums.Input.L_KICK
    elseif inputAttack == enums.InputAttackCodes.x1x4 then
        return enums.Input.L_HAND + enums.Input.R_KICK
    elseif inputAttack == enums.InputAttackCodes.x2x3 then
        return enums.Input.R_HAND + enums.Input.L_KICK
    elseif inputAttack == enums.InputAttackCodes.x2x4 then
        return enums.Input.R_HAND + enums.Input.R_KICK
    elseif inputAttack == enums.InputAttackCodes.x3x4 then
        return enums.Input.L_KICK + enums.Input.R_KICK
    -- 3
    elseif inputAttack == enums.InputAttackCodes.x1x2x3 then
        return enums.Input.L_HAND + enums.Input.R_HAND + enums.Input.L_KICK
    elseif inputAttack == enums.InputAttackCodes.x1x2x4 then
        return enums.Input.L_HAND + enums.Input.R_HAND + enums.Input.R_KICK
    elseif inputAttack == enums.InputAttackCodes.x1x3x4 then
        return enums.Input.L_HAND + enums.Input.L_KICK + enums.Input.R_KICK
    elseif inputAttack == enums.InputAttackCodes.x2x3x4 then
        return enums.Input.R_HAND + enums.Input.L_KICK + enums.Input.R_KICK
    -- 4
    elseif inputAttack == enums.InputAttackCodes.x1x2x3x4 then
        return enums.Input.L_HAND + enums.Input.R_HAND + enums.Input.L_KICK + enums.Input.R_KICK
    end
    return 0
end

function getInputAttackString(inputAttack)
    if inputAttack == enums.InputAttackCodes.x1 then
        return "enums.Input.L_HAND"
    elseif inputAttack == enums.InputAttackCodes.x2 then
        return "enums.Input.R_HAND"
    elseif inputAttack == enums.InputAttackCodes.x3 then
        return "enums.Input.L_KICK"
    elseif inputAttack == enums.InputAttackCodes.x4 then
        return "enums.Input.R_KICK"
    -- 2
    elseif inputAttack == enums.InputAttackCodes.x1x2 then
        return "enums.Input.L_HAND + enums.Input.R_HAND"
    elseif inputAttack == enums.InputAttackCodes.x1x3 then
        return "enums.Input.L_HAND + enums.Input.L_KICK"
    elseif inputAttack == enums.InputAttackCodes.x1x4 then
        return "enums.Input.L_HAND + enums.Input.R_KICK"
    elseif inputAttack == enums.InputAttackCodes.x2x3 then
        return "enums.Input.R_HAND + enums.Input.L_KICK"
    elseif inputAttack == enums.InputAttackCodes.x2x4 then
        return "enums.Input.R_HAND + enums.Input.R_KICK"
    elseif inputAttack == enums.InputAttackCodes.x3x4 then
        return "enums.Input.L_KICK + enums.Input.R_KICK"
    -- 3
    elseif inputAttack == enums.InputAttackCodes.x1x2x3 then
        return "enums.Input.L_HAND + enums.Input.R_HAND + enums.Input.L_KICK"
    elseif inputAttack == enums.InputAttackCodes.x1x2x4 then
        return "enums.Input.L_HAND + enums.Input.R_HAND + enums.Input.R_KICK"
    elseif inputAttack == enums.InputAttackCodes.x1x3x4 then
        return "enums.Input.L_HAND + enums.Input.L_KICK + enums.Input.R_KICK"
    elseif inputAttack == enums.InputAttackCodes.x2x3x4 then
        return "enums.Input.R_HAND + enums.Input.L_KICK + enums.Input.R_KICK"
    -- 4
    elseif inputAttack == enums.InputAttackCodes.x1x2x3x4 then
        return "enums.Input.L_HAND + enums.Input.R_HAND + enums.Input.L_KICK + enums.Input.R_KICK"
    end
    return "0"
end

function RecordingFunction(self, enemy)
    if not isRecording then return end
    currentFrame = currentFrame + 1
    local inputDirection = self.InputDirection
    local inputAttack = self.InputAttack
    if lastFrame == 0 then
        if (inputDirection ~= 32 or inputAttack ~= 0) and (lastInputDirection == 0 or lastInputAttack == 0) then
            lastInputDirection = inputDirection
            lastInputAttack = inputAttack
            lastFrame = currentFrame
            return 
        end
    else
        if inputDirection ~= lastInputDirection or inputAttack ~= lastInputAttack then
            table.insert(recordData, {
                inputDirection = lastInputDirection,
                inputAttack = lastInputAttack,
                delay = currentFrame - lastFrame,
            })
            lastInputDirection = inputDirection
            lastInputAttack = inputAttack
            lastFrame = currentFrame
        end
    end
end


myScript:onTick(function(self, enemy)
	if autoPEWGFFlag then
		DisableKeyboardInput()
		executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
		executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
		local randDelay = getRandomInt(5, 8) 
		executeMacro(enums.Input.DOWN, 0, 1, enums.InputType.KEY_DOWN)
        executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_HAND, randDelay, enums.InputType.KEY_DOWN)
		executeMacro(enums.Input.FORWARD + enums.Input.DOWN, 0, 1, enums.InputType.KEY_PRESS)
		EnableKeyboardInput()
		autoPEWGFFlag = false
	end
	RecordingFunction(self, enemy)
	--Whiffing Punishment
	if self.Distance < 2200.00 and enemy.Recovery - enemy.MoveTimer - enemy.Startup == 0 and config.useWhiffPunish then
		local autoRate = getRandomInt(0, 100)
		local AttackType = 0
		local Startup = 0
		local HitOutcome = 0
		local StunState = 0
		for i = 0, 30 do
			local oldCharacterState = getCharacterState(i)
			if self.StunState ~= 0 then
				StunState = self.StunState
			end
			if enemy.AttackType ~= 0 then
				AttackType = enemy.AttackType
			end
			if self.HitOutcome ~= 0 then
				HitOutcome = self.HitOutcome
			end
			if oldCharacterState.enemy.Startup ~= 0 then
				Startup = oldCharacterState.enemy.Startup
			break
			end
		end
		if Startup > 0 and AttackType ~= 0 and HitOutcome == 0 and StunState == 0 and utils.IsAttackWhiffing(enemy) and config.whiffPunishChance >= autoRate then
			if config.whiffPunishType == 0 then
				DisableKeyboardInput()
				executeMacro(enums.Input.UP , enums.Input.R_KICK, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 1 then
				DisableKeyboardInput()
				executeMacro(enums.Input.DOWN + enums.Input.FORWARD , enums.Input.L_HAND, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 2 then
				DisableKeyboardInput()
				executeMacro(0, enums.Input.L_HAND, 5 , enums.InputType.KEY_PRESS)
				executeMacro(0, enums.Input.R_HAND, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 3 then
				DisableKeyboardInput()
				executeMacro(enums.Input.FORWARD, enums.Input.L_HAND + enums.Input.R_HAND, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 4 then
				DisableKeyboardInput()
				executeMacro(enums.Input.FORWARD, enums.Input.R_KICK + enums.Input.R_HAND, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 5 then
				DisableKeyboardInput()
				executeMacro(enums.Input.BACK, enums.Input.L_HAND + enums.Input.R_HAND, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 6 then
				DisableKeyboardInput()
				executeMacro(enums.Input.DOWN + enums.Input.FORWARD , enums.Input.R_HAND, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 7 then
				DisableKeyboardInput()
				executeMacro(enums.Input.BACK , enums.Input.L_KICK, 5 , enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
			if config.whiffPunishType == 8 then
				DisableKeyboardInput()
				executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
				executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
				executeMacro(enums.Input.DOWN, 0, 1, enums.InputType.KEY_DOWN)
				local randDelay = getRandomInt(5, 8) 
				executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_HAND, randDelay, enums.InputType.KEY_DOWN)
				executeMacro(enums.Input.FORWARD + enums.Input.DOWN, 0, 1, enums.InputType.KEY_PRESS)
				EnableKeyboardInput()
			end
		end
	end
end)

function StartRecording()
   currentFrame = 0
   lastFrame = 0
   isRecording = true
   recordData = {}
   print("Recording started")
end

function EndRecording()
   isRecording = false
   print("Recording ended")
end

function PlaybackRecording()
     if #recordData == 0 then
         print("No recorded data to play back")
     else
         for _, data in ipairs(recordData) do
			if data.inputDirection ~= 32 or data.inputAttack ~= 0 then
				asyncExecuteMacro(getInputDirectionCode(data.inputDirection), getInputAttackCode(data.inputAttack), data.delay, enums.InputType.KEY_DOWN)
				asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			else
				asyncDelayFrames(data.delay)
			end
         end
     end
end

-- Window event
myScript:onMessage(function(msg, wParam, lParam)
	-- msg = 256 input
	-- msg = 257 input up
	if msg == 256 then	
		if wParam == config.autoPEWGFKey and config.autoPEWGF then
			autoPEWGFFlag = true
		end
	end
	if msg == 257 then	
		if wParam == config.StartRecordingKey then
			StartRecording()
		end
		if wParam == config.EndRecordingKey then
			EndRecording()
		end
		if wParam == config.PlaybackRecordingKey then
			PlaybackRecording()
		end
		if wParam == config.autoBackDashKey and config.autoBackDash then
			asyncDisableKeyboardInput()
			asyncExecuteMacro(enums.Input.BACK, 0, 1, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(enums.Input.BACK + enums.Input.DOWN, 0, 1, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(enums.Input.BACK, 0, 1, enums.InputType.KEY_PRESS)
			asyncExecuteMacro(enums.Input.BACK, 0, 1, enums.InputType.KEY_PRESS)
			asyncEnableKeyboardInput()
		end
		if wParam == config.autoWaveDashKey and config.autoWaveDash then
			asyncDisableKeyboardInput()
			asyncExecuteMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
			asyncExecuteMacro(enums.Input.DOWN, 0, 1, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(enums.Input.FORWARD + enums.Input.DOWN, 0, 1, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
			asyncEnableKeyboardInput()
		end
		if wParam == config.autoPEWGFKey and config.autoPEWGF then
			autoPEWGFFlag = false
		end
		if wParam == config.autoDownSideStepKey and config.autoDownSideStep then
			asyncDisableKeyboardInput()
			asyncExecuteMacro(enums.Input.DOWN, 0, 1, enums.InputType.KEY_PRESS)
			asyncExecuteMacro(enums.Input.DOWN, 0, 1, enums.InputType.KEY_PRESS)
			asyncEnableKeyboardInput()
		end
		if wParam == config.autoUpSideStepKey and config.autoUpSideStep then
			asyncDisableKeyboardInput()
			asyncExecuteMacro(enums.Input.UP, 0, 1, enums.InputType.KEY_PRESS)
			asyncExecuteMacro(enums.Input.UP, 0, 1, enums.InputType.KEY_PRESS)
			asyncEnableKeyboardInput()
		end
	end
end)

myScript:onMenu(function()
    -- Auto Whiff Punish Configuration Section
    menu.text('Auto Whiff Punish Configuration')
    menu.sameLine()
    menu.help("Enable automatic responses to whiffed attacks, including blocking and punishing with a specified probability.")

    -- Enable Whiff Punish Checkbox
    config.useWhiffPunish = menu.checkbox("Enable Auto Whiff Punish", config.useWhiffPunish)
    
	config.whiffPunishType = menu.combo('whiff Punish Combo Type', config.whiffPunishType, { "USE COMBO U4", "USE COMBO DF1", "USE COMBO 1+2", "USE COMBO F+1+2" , "USE COMBO F+2+4", "USE COMBO B+1+2" , "USE COMBO DF2" , "USE COMBO B3", "USE COMBO PEWGF" })
    -- Whiff Punish Chance Slider
    config.whiffPunishChance = menu.sliderInt("Whiff Counterattack Chance (%)", config.whiffPunishChance, 0, 100)
    
    menu.separator()

    -- Auto ComboTool Configuration Section
    menu.text('Auto ComboTool Configuration')
    menu.sameLine()
    menu.help("Assign a key for one-click combos and select the combo type for execution.")

    -- Auto Combo Checkbox for Back Dash
    config.autoBackDash = menu.checkbox('Enable Back Dash', config.autoBackDash)
    menu.sameLine()
    -- Auto Combo Checkbox for Wave Dash
    config.autoWaveDash = menu.checkbox('Enable Wave Dash', config.autoWaveDash)
    menu.sameLine()
    -- Auto Combo Checkbox for PEWGF (Perfect Electric Wind God Fist)
    config.autoPEWGF = menu.checkbox('Enable PEWGF', config.autoPEWGF)
    menu.sameLine()
    -- Auto Combo Checkbox for PEWGF (Perfect Electric Wind God Fist)
	config.autoPEWGF = menu.checkbox('Enable PEWGF', config.autoPEWGF)
	menu.sameLine()

	-- Auto Combo Checkbox for Up Side Step
	config.autoUpSideStep = menu.checkbox('Enable Up Side Step', config.autoUpSideStep)
	menu.sameLine()

	-- Auto Combo Checkbox for Down Side Step
	config.autoDownSideStep = menu.checkbox('Enable Down Side Step', config.autoDownSideStep)

    menu.separator()

    -- Key Select for Back Dash Combo
    config.autoBackDashKey = menu.keySelect('Back Dash Key', config.autoBackDashKey)
    menu.sameLine()
    -- Key Select for Wave Dash Combo
    config.autoWaveDashKey = menu.keySelect('Wave Dash Key', config.autoWaveDashKey)
    menu.sameLine()
    -- Key Select for PEWGF Combo
    config.autoPEWGFKey = menu.keySelect('PEWGF Combo Key', config.autoPEWGFKey)
	menu.sameLine()
	-- Key Select for Down Side Step
	config.autoDownSideStepKey = menu.keySelect('Down Side Step Key', config.autoDownSideStepKey)
	menu.sameLine()
	-- Key Select for Up Side Step
	config.autoUpSideStepKey = menu.keySelect('Up Side Step Key', config.autoUpSideStepKey)

	--Recording script
	menu.separator()
	menu.text("Recording Actions:")
	menu.sameLine()
	menu.help("Start, stop, and playback recorded actions, including directional inputs and attack combinations, which can be replayed for automation.")

    if menu.button("Start Recording") then
		StartRecording()
    end
    menu.sameLine()
    if menu.button("End Recording") then
		EndRecording()
    end
	menu.sameLine()
    if menu.button("Playback Recording") then
		PlaybackRecording()
    end

    menu.sameLine()
    if menu.button("Print Lua Script") then
        local luaScript = ""
        for _, data in ipairs(recordData) do
			if data.inputDirection ~= 32 or data.inputAttack ~= 0 then
				luaScript = luaScript .. string.format("executeMacro(%s,%s,%d,enums.InputType.KEY_DOWN)\n", getInputDirectionString(data.inputDirection), getInputAttackString(data.inputAttack), data.delay)
				luaScript = luaScript .. "executeMacro(0, 0, 0, enums.InputType.KEY_UP)\n"
			else
				luaScript = luaScript .. string.format("delayFrames(%d)\n", data.delay)
			end
        end
        print("Lua script generated:\n" .. luaScript)
    end
	config.StartRecordingKey = menu.keySelect('Start Recording Key', config.StartRecordingKey	)
	menu.sameLine()
	config.EndRecordingKey = menu.keySelect('End Recording Key', config.EndRecordingKey)
    menu.sameLine()
	config.PlaybackRecordingKey = menu.keySelect('Playback Recording', config.PlaybackRecordingKey)
	menu.sameLine()
end)



if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name) ---注册失败，尝试从已注册脚本中拉取
end