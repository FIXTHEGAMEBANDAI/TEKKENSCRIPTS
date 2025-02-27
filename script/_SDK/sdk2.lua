local isBuildMod = true

if (not isBuildMod and Sdk2) then
    return Sdk2
end


local reg = require("_SDK.register")
local json = require('_SDK.json')
local ffi = require("ffi")

local ver = '2.1.0'

-------init class---------

---@class register_class
local register = { name = '', path = '', icon = '' }
register.__index = register
---@return register_class
---@param scriptName string
---@param icon string|nil
function register:New(scriptName, icon)
    if icon == nil then icon = '' end
    local info = debug.getinfo(2)
    local path = info.source:sub(2, info.source:len() - info.source:reverse():find('\\') + 1)
    local new = { name = scriptName, path = path, icon = icon }
    setmetatable(new, self)
    return new
end

local Enums = {}
local Menu = {}
local Draw = {}
local utils = {}

---@enum All
----------------------enums------------------------
Enums.Input = {
    --move input
    UP = 0x00000001,
    DOWN = 0x00000002,
    BACK = 0x00000004,
    FORWARD = 0x00000008,
    --combo inpt
    L_HAND = 0x00004000,
    R_HAND = 0x00008000,
    L_KICK = 0x00001000,
    R_KICK = 0x00002000,
    L_B = 0x00000200
}

Enums.InputType = {
    KEY_DOWN = 0,
    KEY_UP = 1,
    KEY_PRESS = 2
}

Enums.Keys = {
    CANCEL = 0x03,
    HELP = 0x06,
    BACK_SPACE = 0x08,
    TAB = 0x09,
    CLEAR = 0x0C,
    ENTER = 0x0D,
    SHIFT = 0x10,
    CONTROL = 0x11,
    ALT = 0x12,
    PAUSE = 0x13,
    CAPS_LOCK = 0x14,
    KANA = 0x15,
    HANGUL = 0x15,
    EISU = 0x16,
    JUNJA = 0x17,
    FINAL = 0x18,
    HANJA = 0x19,
    KANJI = 0x19,
    ESC = 0x1B,
    CONVERT = 0x1C,
    NONCONVERT = 0x1D,
    ACCEPT = 0x1E,
    MODECHANGE = 0x1F,
    SPACE = 0x20,
    PAGE_UP = 0x21,
    PAGE_DOWN = 0x22,
    END = 0x23,
    HOME = 0x24,
    LEFT = 0x25,
    UP = 0x26,
    RIGHT = 0x27,
    DOWN = 0x28,
    SELECT = 0x29,
    PRINT = 0x2A,
    EXECUTE = 0x2B,
    PRINTSCREEN = 0x2C,
    INSERT = 0x2D,
    DELETE = 0x2E,
    _0 = 0x30,
    _1 = 0x31,
    _2 = 0x32,
    _3 = 0x33,
    _4 = 0x34,
    _5 = 0x35,
    _6 = 0x36,
    _7 = 0x37,
    _8 = 0x38,
    _9 = 0x39,
    COLON = 0x3A,
    LESS_THAN = 0x3C,
    EQUALS = 187,
    GREATER_THAN = 0x3E,
    QUESTION_MARK = 0x3F,
    AT = 0x40,
    A = 0x41,
    B = 0x42,
    C = 0x43,
    D = 0x44,
    E = 0x45,
    F = 0x46,
    G = 0x47,
    H = 0x48,
    I = 0x49,
    J = 0x4A,
    K = 0x4B,
    L = 0x4C,
    M = 0x4D,
    N = 0x4E,
    O = 0x4F,
    P = 0x50,
    Q = 0x51,
    R = 0x52,
    S = 0x53,
    T = 0x54,
    U = 0x55,
    V = 0x56,
    W = 0x57,
    X = 0x58,
    Y = 0x59,
    Z = 0x5A,
    WIN = 0x5B,
    CONTEXT_MENU = 0x5D,
    SLEEP = 0x5F,
    NUMPAD0 = 0x60,
    NUMPAD1 = 0x61,
    NUMPAD2 = 0x62,
    NUMPAD3 = 0x63,
    NUMPAD4 = 0x64,
    NUMPAD5 = 0x65,
    NUMPAD6 = 0x66,
    NUMPAD7 = 0x67,
    NUMPAD8 = 0x68,
    NUMPAD9 = 0x69,
    MULTIPLY = 0x6A,
    ADD = 0x6B,
    SEPARATOR = 0x6C,
    SUBTRACT = 189,
    DECIMAL = 0x6E,
    DIVIDE = 0x6F,
    F1 = 0x70,
    F2 = 0x71,
    F3 = 0x72,
    F4 = 0x73,
    F5 = 0x74,
    F6 = 0x75,
    F7 = 0x76,
    F8 = 0x77,
    F9 = 0x78,
    F10 = 0x79,
    F11 = 0x7A,
    F12 = 0x7B,
    F13 = 0x7C,
    F14 = 0x7D,
    F15 = 0x7E,
    F16 = 0x7F,
    F17 = 0x80,
    F18 = 0x81,
    F19 = 0x82,
    F20 = 0x83,
    F21 = 0x84,
    F22 = 0x85,
    F23 = 0x86,
    F24 = 0x87,
    NUM_LOCK = 0x90,
    SCROLL_LOCK = 0x91,
    WIN_OEM_FJ_JISHO = 0x92,
    WIN_OEM_FJ_MASSHOU = 0x93,
    WIN_OEM_FJ_TOUROKU = 0x94,
    WIN_OEM_FJ_LOYA = 0x95,
    WIN_OEM_FJ_ROYA = 0x96,
    CIRCUMFLEX = 0xA0,
    EXCLAMATION = 0xA1,
    DOUBLE_QUOTE = 0xA3,
    HASH = 0xA3,
    DOLLAR = 0xA4,
    PERCENT = 0xA5,
    AMPERSAND = 0xA6,
    UNDERSCORE = 0xA7,
    OPEN_PAREN = 0xA8,
    CLOSE_PAREN = 0xA9,
    ASTERISK = 0xAA,
    PLUS = 0xAB,
    PIPE = 0xAC,
    HYPHEN_MINUS = 0xAD,
    OPEN_CURLY_BRACKET = 0xAE,
    CLOSE_CURLY_BRACKET = 0xAF,
    TILDE = 0xB0,
    SEMICOLON = 0xBA,
    VOLUME_MUTE = 0xB5,
    VOLUME_DOWN = 0xB6,
    VOLUME_UP = 0xB7,
    COMMA = 0xBC,
    PERIOD = 0xBE,
    SLASH = 0xBF,
    BACK_QUOTE = 0xC0,
    OPEN_BRACKET = 0xDB,
    BACK_SLASH = 0xDC,
    CLOSE_BRACKET = 0xDD,
    QUOTE = 0xDE,
    META = 0xE0,
    ALTGR = 0xE1,
    WIN_ICO_HELP = 0xE3,
    WIN_ICO_00 = 0xE4,
    WIN_ICO_CLEAR = 0xE6,
    WIN_OEM_RESET = 0xE9,
    WIN_OEM_JUMP = 0xEA,
    WIN_OEM_PA1 = 0xEB,
    WIN_OEM_PA2 = 0xEC,
    WIN_OEM_PA3 = 0xED,
    WIN_OEM_WSCTRL = 0xEE,
    WIN_OEM_CUSEL = 0xEF,
    WIN_OEM_ATTN = 0xF0,
    WIN_OEM_FINISH = 0xF1,
    WIN_OEM_COPY = 0xF2,
    WIN_OEM_AUTO = 0xF3,
    WIN_OEM_ENLW = 0xF4,
    WIN_OEM_BACKTAB = 0xF5,
    ATTN = 0xF6,
    CRSEL = 0xF7,
    EXSEL = 0xF8,
    EREOF = 0xF9,
    PLAY = 0xFA,
    ZOOM = 0xFB,
    PA1 = 0xFD,
    WIN_OEM_CLEAR = 0xFE
}

Enums.InputDirectionCodes = {
    NA = 0,
    N = 0x20,
    u = 0x100,
    ub = 0x80,
    uf = 0x200,
    f = 0x40,
    b = 0x10,
    d = 4,
    df = 8,
    db = 2
}

Enums.InputAttackCodes = {
    N = 0,
    x1 = 512,
    x2 = 1024,
    x3 = 2048,
    x4 = 4096,
    x1x2 = 1536,
    x1x3 = 2560,
    x1x4 = 4608,
    x2x3 = 3072,
    x2x4 = 5120,
    x3x4 = 6144,
    x1x2x3 = 3584,
    x1x2x4 = 5632,
    x1x3x4 = 6656,
    x2x3x4 = 7168,
    x1x2x3x4 = 7680,
    xRAGE = 8192
}

Enums.AttackType = {
    ANTIAIR_ONLY = 11,    -- Attack type that only affects airborne opponents, e.g., Alisa's chainsaw stance f+2
    THROW = 10,           -- Attack type that only works during a throw animation
    LOW_UNBLOCKABLE = 9,  -- Attack type that cannot be blocked low, e.g., Yoshimitsu's 10-hit 2
    HIGH_UNBLOCKABLE = 8, -- Attack type that cannot be blocked high, e.g., Akuma's charged attack
    MID_UNBLOCKABLE = 7,  -- Attack type that cannot be blocked mid
    UNKNOWN = 6,          -- Unknown attack type (may not exist)
    HIGH = 5,             -- High attack type
    SMID = 4,             -- Special mid attack type
    PROJ = 3,             -- Projectile attack type, special mid attack that cannot be parried. Unknown if it has other common properties.
    MID = 2,              -- Mid attack type
    LOW = 1,              -- Low attack type
    NA = 0                -- Non-attack type, the action is not an attack
}

Enums.SimpleMoveType = {
    UNINITIALIZED = 0,    -- Move state uninitialized
    STANDING_FORWARD = 1, -- Moving forward while standing
    STANDING_BACK = 2,    -- Moving backward while standing
    STANDING = 3,         -- Standing state
    STEVE = 4,            -- Steve?
    CROUCH_FORWARD = 5,   -- Moving forward while crouching
    CROUCH_BACK = 6,      -- Moving backward while crouching
    CROUCH = 7,           -- Crouching state
    UNKNOWN_TYPE_9 = 9,   -- Seen on Ling
    GROUND_FACEUP = 12,   -- Grounded face-up state
    GROUND_FACEDOWN = 13, -- Grounded face-down state
    JUGGLED = 14,         -- Juggled state
    KNOCKDOWN = 15,       -- Knockdown state
    OFF_AXIS_GETUP = 8,   -- Understanding of the following values is incomplete
    UNKNOWN_10 = 10,      -- Yoshimitsu
    UNKNOWN_GETUP_11 = 11,
    WALL_SPLAT_18 = 18,
    WALL_SPLAT_19 = 19,
    TECH_ROLL_OR_FLOOR_BREAK = 20,
    UNKNOWN_23 = 23,  -- Kuma
    AIRBORNE_24 = 24, -- Yoshimitsu
    AIRBORNE = 25,
    AIRBORNE_26 = 26, -- Eliza, Chloe
    FLY = 27          -- Devil Jin 3+4
}

Enums.ComplexMoveType = {
    F_MINUS = 0,         -- Represents both empty state and attack Startup. # Happens in Kazuya's hell sweep
    S_PLUS = 1,          -- Tracking
    S = 2,               -- Tracking, usually with a screw, seems slightly easier to deviate from the axis?
    A = 3,               -- This action 'realigns' if you pause before the throw
    UN04 = 4,            -- Extremely rare, Eliza's front front kick has this
    C_MINUS = 5,         -- Realigning, either worse than C or slightly better, hard to say
    A_PLUS = 6,          -- Realignment is very good # Alisa's b+2 1 has this, very rare
    C = 7,               -- This realignment is worse than 'A'
    END1 = 10,           -- After Startup ### Kazuya's front front jump has no Startup or attack end mark, the whole process is 0 ??? ### Lily's d/b+4 is blocked and no
    BLOCK = 11,          -- In defense
    WALK = 12,           -- Used for dashing and walking
    SIDEROLL_GETUP = 13, -- Only happens after rolling sideways???
    SIDEROLL_STAYDOWN = 14,
    SS = 15,             -- Side step left or right, also used for striking techniques
    RECOVERING = 16,     -- Occurs when stopping forward or backward movement, jumping, being hit, entering a stance, etc.
    UN17 = 17,           -- f+4 with Ling
    UN18 = 18,           -- King's 1+2+3+4 luck charge
    UN20 = 20,           -- Dragunov's d+3+4 ground jump
    UN22 = 22,           -- Eddy's move
    UN23 = 23,           -- Steve 3+4 1
    SW = 28,             -- Sidewalk left or right
    BROKEN_54 = 54,
    UNKN = 999999        -- Used to indicate non-standard tracking actions
}

Enums.StunType = {
    NONE = 0,                  -- No stun status
    UNKNOWN_2 = 2,             -- Unknown status 2 (possibly used to describe certain skills, such as Lili's BT (back turned) state, jumping, or kicking)
    BLOCK = 16777472,          -- Blocking status
    GETTING_HIT = 256,         -- Being hit status
    DOING_THE_HITTING = 65536, -- Attacking status
    BEING_PUNISHED = 65792,    -- Being punished status (the starting frame of the punishment state, also occurs when being countered at the same time)
    BLOCK_NO_HIT = 16777216    -- Blocking without being hit status (possibly used to describe certain skills, such as Law's UF+4, sometimes may be close to defense)
}

Enums.HitType = {
    NONE = 0,                       -- Not hit
    BLOCKED_STANDING = 1,           -- Blocked while standing
    BLOCKED_CROUCHING = 2,          -- Blocked while crouching
    JUGGLE = 3,                     -- Juggle state
    SCREW = 4,                      -- Screw state
    UNKNOWN_SCREW_5 = 5,            -- Unknown hit state 5 (possibly related to Xiaoyu's demo combo 3 ending, may be off-axis or right side state)
    UNKNOWN_6 = 6,                  -- Unknown hit state 6 (possibly non-existent)
    UNKNOWN_SCREW_7 = 7,            -- Unknown screw hit state 7 (Xiaoyu's demo combo 3 includes this state)
    GROUNDED_FACE_DOWN = 8,         -- Grounded, FacingDirection down
    GROUNDED_FACE_UP = 9,           -- Grounded, FacingDirection up
    COUNTER_HIT_STANDING = 10,      -- Counter hit while standing
    COUNTER_HIT_CROUCHING = 11,     -- Counter hit while crouching
    NORMAL_HIT_STANDING = 12,       -- Normal hit while standing
    NORMAL_HIT_CROUCHING = 13,      -- Normal hit while crouching
    NORMAL_HIT_STANDING_LEFT = 14,  -- Normal hit on the left while standing
    NORMAL_HIT_CROUCHING_LEFT = 15, -- Normal hit on the left while crouching
    NORMAL_HIT_STANDING_BACK = 16,  -- Normal hit on the back while standing
    NORMAL_HIT_CROUCHING_BACK = 17, -- Normal hit on the back while crouching
    NORMAL_HIT_STANDING_RIGHT = 18, -- Normal hit on the right while standing
    NORMAL_HIT_CROUCHING_RIGHT = 19 -- Normal hit on the right while crouching
}

Enums.ThrowType = {
    NONE = 0,           -- No throw
    TE1 = 3489660956,   -- Throw escape 1
    TE2 = 3758096415,   -- Throw escape 2
    TE1_2 = 4026531870, -- Throw escape 1+2
    TE1_3 = 2415919128,
    BROKEN = 3221225501 -- Broken throw
}

Enums.CharacterState = {
    MoveTimer = 0,                  --- @type integer: The move timer value, tracks the time since the move started.
    MoveID = 0,                     --- @type integer: The ID of the move currently being executed.
    CharacterID = 0,                --- @type integer: The unique ID of the character.
    Startup = 0,                    --- @type integer: The startup time of the move, in frames.
    StartupEnd = 0,                 --- @type integer: The frame at which the move's startup phase ends.
    EndFrame = 0,                   --- @type integer: The frame at which the move ends or the attack completes.
    AttackBonesType = 0,            --- @type integer: Defines the type of attack (e.g., hand, foot, etc.).
    StunState = 0,                  --- @type integer: The state of the character regarding stun (e.g., not stunned, stunned).
    HitOutcome = 0,                 --- @type integer: The result of a hit, such as whether it was a successful hit or blocked.
    ThrowTech = 0,                  --- @type integer: Indicates whether the character is performing a throw tech or escaping a throw.
    Distance = 0.0,                 --- @type number: The distance between the character and the opponent.
    SimpleMoveState = 0,            --- @type integer: The state of simple movements (e.g., walking, running).
    ComplexMoveState = 0,           --- @type integer: The state of complex movements (e.g., crouching, jumping).
    Recovery = 0,                   --- @type integer: The time (in frames) required to recover after a move or action.
    FuturePowerCrush = false,       --- @type boolean: A flag indicating whether a future Power Crush move is being executed.
    FutureHomingAttack = false,     --- @type boolean: A flag indicating whether a future Homing Attack move is being executed.
    FutureHeatSmashBeta = false,    --- @type boolean: A flag indicating whether a future Heat Smash Beta move is being executed.
    IsThrowing = false,             --- @type boolean: A boolean flag indicating whether the character is currently throwing an opponent.
    IsAir = false,                  --- @type boolean: A boolean flag indicating whether the character is in the air (e.g., jumping).
    IsRageStarte = false,           --- @type boolean: A boolean flag indicating whether the character is in a rage state.
    IsHeatSmashUsed = false,        --- @type boolean: A boolean flag indicating whether the character has already used a Heat Smash move.
    AttackType = 0,                 --- @type integer: The type of attack being executed (e.g., punch, kick, special).
    AttackDamage = 0,               --- @type integer: The amount of damage the attack will inflict on the opponent.
    InputDirection = 0,             --- @type integer: The direction input by the player (e.g., up, down, left, right).
    InputAttack = 0,                --- @type integer: The attack input by the player (e.g., punch, kick).
    FacingDirection = 0,            --- @type integer: The direction the character is currently facing.
    FrameCount = 0                  --- @type integer: The current frame count in the game or move execution.
}

Enums.Snapshot = {
	self  = Enums.CharacterState,
	enemy =  Enums.CharacterState
}

-------init class ---------

-----------------------utils------------------------

utils.CanRun = function(self)
	if self.MoveState == 15 or self.MoveState == 14 or self.ComplexMoveState == 13 or self.ComplexMoveState == 14 then
		return false
	end
	if utils.IsAttackStarting(self) then
		return false
	end
	return true
end

utils.getAttackTypeString =function(attackType)
    for name, value in pairs(Enums.AttackType) do
        if value == attackType then
            return name
        end
    end
    return "Unknown" -- Default if the type isn't found
end

-- 蹲姿起身瞬间发动攻击，惩罚对手攻击
utils.IsWSpunish = function(self, enemy)
    -- 检查玩家是否处于向后蹲（CROUCH_BACK）或蹲姿（CROUCH）状态
    if
        (self.SimpleMoveState == Enums.SimpleMoveType.CROUCH_BACK or self.SimpleMoveState == Enums.SimpleMoveType.CROUCH) and
        (enemy.AttackType ~= Enums.AttackType.MID or enemy.AttackType ~= Enums.AttackType.HIGH) and
        self.ComplexMoveState == Enums.ComplexMoveType.BLOCK
    then
        return true
    end
    return false
end
-- 特殊状态检查
utils.IsSpecialStatus = function(self)
    return self.SimpleMoveState == Enums.SimpleMoveType.KNOCKDOWN or self.SimpleMoveState == Enums.SimpleMoveType.JUGGLED or
        self.ComplexMoveState == Enums.ComplexMoveType.SIDEROLL_GETUP or
        self.ComplexMoveState == Enums.ComplexMoveType.SIDEROLL_STAYDOWN
end
-- 判断是否在墙上
utils.IsGettingWallSplatted = function(self)
    return self.SimpleMoveState == Enums.SimpleMoveType.WALL_SPLAT_18 or self.SimpleMoveState == Enums.SimpleMoveType.WALL_SPLAT_19
end
-- 判断是否蹲着
utils.IsCrouching = function(self)
    return self.SimpleMoveState == Enums.SimpleMoveType.CROUCH_FORWARD or self.SimpleMoveState == Enums.SimpleMoveType.CROUCH_BACK or
        self.SimpleMoveState == Enums.SimpleMoveType.CROUCH
end
-- 获取非0攻击类型
utils.GetEnemyAttackTypeNotZero = function()
    for i = 0, 30 do
        local GameSnapshot = getCharacterState(i)  -- 获取相应的状态
        if GameSnapshot.enemy.AttackType ~= 0 then
            return GameSnapshot.enemy.AttackType
        end
    end
    return 0
end

-- 判断是否被击倒在地
utils.IsGettingGroundHit = function(self)
    return self.HitOutcome == Enums.HitType.GROUNDED_FACE_DOWN or self.HitOutcome == Enums.HitType.GROUNDED_FACE_UP
end
utils.IsCrouchBack = function(self)
    return self.SimpleMoveState == Enums.SimpleMoveType.CROUCH_BACK
end
-- 判断是否处于反击状态
utils.IsGettingCounterHit = function(self)
    return self.HitOutcome == Enums.HitType.COUNTER_HIT_CROUCHING or
    self.HitOutcome == Enums.HitType.COUNTER_HIT_STANDING
end
-- 判断攻击是否无法格挡
utils.IsAttackUnblockable = function(self)
    return self.AttackType == Enums.AttackType.HIGH_UNBLOCKABLE or self.AttackType == Enums.AttackType.LOW_UNBLOCKABLE or
        self.AttackType == Enums.AttackType.MID_UNBLOCKABLE
end
-- 判断是否处于空中
utils.IsAirborne = function(attacker)
    local airborne_states = {
        Enums.SimpleMoveType.JUGGLED,
        Enums.SimpleMoveType.AIRBORNE_24,
        Enums.SimpleMoveType.AIRBORNE,
        Enums.SimpleMoveType.FLY,
        Enums.SimpleMoveType.AIRBORNE_26
    }
    for _, state in ipairs(airborne_states) do
        if attacker.SimpleMoveState == state then
            return true
        end
    end
    return false
end

-- 获取对手攻击到达的时间（帧数）
utils.GetTimeUntilImpact = function(attacker)
    return attacker.Startup- attacker.MoveTimer + attacker.StartupEnd - attacker.Startup + 1
end

-- 判断是否可以进行反击，条件包括：不处于防御状态、对手攻击超过一定帧数、对手处于空中等。
utils.CanCounter = function(frames, attacker, receiver, airborneOpp)
    -- 不要反击碾压攻击
    if attacker.FuturePowerCrush then
        return false
    end
    -- 如果接收者处于防御状态，无法进行反击 预测模式不使用
    if utils.IsBlocking(receiver) then
        return false
    end
    -- 如果攻击帧数大于10，可以进行反击
    if frames > 10 then
        -- 如果对手在空中且攻击帧数大于5，可以进行反击
        return true
    elseif airborneOpp and frames > 5 then
        -- 其他情况下无法进行反击
        return true
    else
        return false
    end
end

utils.WaitDistance = function(Distance)
    for i = 1, 50 do
        if utils.getDistance() <= Distance then
            return 
        end
        delayFrames(1)
    end
end

utils.getDistance = function()
    local x1, y1 = getLocalPosX(), getLocalPosY()
    local x2, y2 = getOpponentPosX(), getOpponentPosY()
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

utils.IsAttackStarting = function(self)
    -- 判断是否开始攻击
    if self.Startup > 0 then
        local is_active = self.MoveTimer <= self.Startup
        return is_active
    else
        return false
    end
end

utils.IsAttackThrow = function(self)
    -- 判断攻击是否为投掷
    return self.AttackType == Enums.AttackType.THROW
end
utils.IsOnGround = function(self)
    -- 判断是否在地面上
    local ground_states = {
        Enums.SimpleMoveType.GROUND_FACEDOWN,
        Enums.SimpleMoveType.GROUND_FACEUP
    }
    for _, state in ipairs(ground_states) do
        if self.SimpleMoveState == state then
            return true
        end
    end
    return false
end
-- 是否正在防御期间
utils.IsBlocking = function(self)
    return self.ComplexMoveState == Enums.ComplexMoveType.BLOCK
end
-- 判断是否正在受击
utils.IsGettingHit = function(self)
    return self.StunState == Enums.StunType.BEING_PUNISHED or self.StunState == Enums.StunType.GETTING_HIT
end
utils.IsPunish = function(self)
    -- 判断是否在惩罚状态
    return self.StunState == Enums.StunType.BEING_PUNISHED
end

-- 判断是否站立
utils.IsWhileStanding = function(self)
    return self.SimpleMoveState == Enums.SimpleMoveType.CROUCH or self.SimpleMoveState == Enums.SimpleMoveType.CROUCH_BACK or
        self.SimpleMoveState == Enums.SimpleMoveType.CROUCH_FORWARD
end

-- 获取攻击的有效帧数
utils.GetActiveFrames = function(self)
    return self.StartupEnd - self.Startup + 1
end

--检查是否挥空
utils.IsAttackWhiffing = function(self)
    return self.ComplexMoveState == Enums.ComplexMoveType.END1 or self.ComplexMoveState == Enums.ComplexMoveType.F_MINUS or
        self.ComplexMoveState == Enums.ComplexMoveType.RECOVERING or
        self.ComplexMoveState == Enums.ComplexMoveType.UN17 or
        self.ComplexMoveState == Enums.ComplexMoveType.UN17 or
        self.ComplexMoveState == Enums.ComplexMoveType.SS or
        self.ComplexMoveState == Enums.ComplexMoveType.WALK
end

---@class sdk2
local sdk2 = {
    enums = Enums,
    Menu = Menu,
    Draw = Draw,
    utils = utils,
    Register = register,
}

-----------------------Menu------------------------
Menu.cache = ""
Menu.path = ""
Menu.conf = {}
Menu.initOver = false
---@param name string
---@param path string
function Menu.setCacheName(name, path)
    if (name == '') then
        return
    end
    Menu.cache = name
    Menu.path = path .. core.menu.uts(Menu.cache) .. '.json'
    if (not Menu.conf[name]) then
        local js = io.open(Menu.path, 'r')
        if (js) then
            local f = js:read('*all')
            if (f ~= "") then
                Menu.conf[name] = json.decode(f)
            else
                Menu.conf[name] = {}
            end

            js:close()
        else
            local f = io.output(Menu.path)
            io.write("{}")
            io.flush()
            io.close()
            Menu.conf[name] = {}
        end
    end
end

function MenuCheckColor(c1, c2)
    if (c1[1] ~= c2[1] or c1[2] ~= c2[2] or
            c1[3] ~= c2[3] or c1[4] ~= c2[4])
    then
        return false
    end
    return true
end

function MenuConfig(key, v)
    if (not Menu.conf[Menu.cache]) then return v end
    local save = false
    local isinit = core.script.isload(Menu.cache)
    -- if not isinit then
    if (type(v) == 'boolean') then
        if (v == nil or not v) then v = false end
        local v2 = v and 1 or 0
        if (type(Menu.conf[Menu.cache][key]) == 'nil') then
            save = true
        else
            if isinit then
                return Menu.conf[Menu.cache][key] == 1 and true or false
            else
                if Menu.conf[Menu.cache][key] ~= v2 then save = true end
            end
        end
        if (not isinit) then Menu.conf[Menu.cache][key] = v2 end
    end
    if (type(v) == 'number') then
        if (v == nil or not v) then v = 0 end
        if (type(Menu.conf[Menu.cache][key]) == 'nil') then
            save = true
        else
            if isinit then
                return Menu.conf[Menu.cache][key]
            else
                if Menu.conf[Menu.cache][key] ~= v then save = true end
            end
        end
        if (not isinit) then Menu.conf[Menu.cache][key] = v end
    end
    if (type(v) == 'table' and #v == 4) then
        if (v == nil or not v) then v = { 0, 0, 0, 0 } end
        if (type(Menu.conf[Menu.cache][key]) == 'nil') then
            save = true
        else
            if isinit then
                return Menu.conf[Menu.cache][key]
            else
                if not MenuCheckColor(Menu.conf[Menu.cache][key], v) then save = true end
            end
        end
        if (not isinit) then Menu.conf[Menu.cache][key] = v end
    end

    if (save) then
        local f = io.output(Menu.path)
        local fn = json.encode(Menu.conf[Menu.cache])
        if fn == "[]" then fn = "{}" end
        io.write(fn)
        io.flush()
        io.close()
    end
    Menu.initOver = isinit
    return v
end


---@param name string
---@param V_bool boolean
---@return boolean
function Menu.checkbox(name, V_bool)
    if (V_bool == nil) then V_bool = false end
    return MenuConfig(name, core.menu.Checkbox(name, V_bool))
end

function Menu.sameLine() core.menu.SameLine() end

function Menu.separator() core.menu.Separator() end

---@param value string
function Menu.text(value) core.menu.Text(value) end

---@param value string
function Menu.help(value) core.menu.help(value) end

---@param value string
---@return boolean
function Menu.button(value) return core.menu.Button(value) end

---@param value string
function Menu.pushID(value) core.menu.PushID(value) end

function Menu.popID() return core.menu.PopID() end

---@param name string
---@param V_float number
---@param min number
---@param max number
---@return number
function Menu.sliderFloat(name, V_float, min, max)
    if (V_float == nil) then V_float = 0 end
    if (min == nil) then min = 0 end
    if (max == nil) then max = 100 end
    return MenuConfig(name, core.menu.SliderFloat(name, V_float, min, max))
end

---@param name string
---@param V_int number
---@param min number
---@param max number
---@return number
function Menu.sliderInt(name, V_int, min, max)
    if (V_int == nil) then V_int = 0 end
    if (min == nil) then min = 0 end
    if (max == nil) then max = 100 end
    return MenuConfig(name, core.menu.SliderInt(name, V_int, min, max))
end

---@param name string
---@param V_int number
---@param comboData string[]
---@return number
function Menu.combo(name, V_int, comboData)
    if (V_int == nil) then V_int = 0 end
    if (comboData == nil) then comboData = { "no value" } end
    for _, v in ipairs(comboData) do comboData[_] = v end
    return MenuConfig(name, core.menu.Combo(name, V_int, comboData))
end

---@param name string
---@param V_rgba table
---@return table
function Menu.colorEdit(name, V_rgba)
    if (V_rgba == nil) then V_rgba = { 1, 1, 1, 1 } end
    return MenuConfig(name, core.menu.ColorEdit(name, V_rgba))
end

---@param name string
---@param V_int number
---@return number
function Menu.keySelect(name, V_int)
    if (V_int == nil) then V_int = 0 end
    return MenuConfig(name, core.menu.KeySelect(name, V_int))
end

---@param idx number
---@param value number
function Menu.PushStyleFloat(idx, value) core.menu.PushStyleFloat(idx, value) end

---@param file string
---@param value Vector2_class
function Menu.Image(file, value) core.menu.Image(file, value:Unpack()) end

---@param idx number
---@param value Vector2_class
function Menu.PushStyleVec2(idx, value) core.menu.PushStyleVec2(idx, value:Unpack()) end

---@param value number
function Menu.PopStyleVar(value) core.menu.PopStyleVar(value) end

---@param name string
---@param flag number|nil
function Menu.Begin(name, flag)
    if flag == nil then flag = 0 end
    core.menu.Begin(name, flag)
end

function Menu.End() core.menu.End() end

---@param name string
---@param size Vector2_class
---@param border boolean|nil
---@param flag number|nil
function Menu.BeginChild(name, size, border, flag)
    if border == nil then border = false end
    if flag == nil then flag = 0 end
    core.menu.BeginChild(name, size:Unpack(), border, flag)
end

function Menu.EndChild() core.menu.EndChild() end

---@param value Vector2_class
function Menu.SetNextWindowPos(value) core.menu.SetNextWindowPos(value:Unpack()) end

---@param value Vector2_class
function Menu.SetNextWindowSize(value) core.menu.SetNextWindowSize(value:Unpack()) end

---------------------register_class------------------

---@param backFunction fun():nil
function register:onMenu(backFunction)
    local sname = self.name
    self.menu = function()
        Menu.pushID(core.menu.uts(sname))
        Menu.setCacheName(sname, self.path)
        backFunction()
        Menu.setCacheName('', '')
        Menu.popID()
    end
end

---@param backFunction fun():nil
function register:onTick(backFunction)
    self.tick = backFunction
end

---@param backFunction fun():nil
function register:onDraw(backFunction)
    self.draw = backFunction
end

---@param backFunction fun():nil
function register:onMessage(backFunction)
    self.message = backFunction
end

---@param outModule table|nil
function register:submit(outModule)
    if outModule == nil then outModule = {} end
    self.outModule = outModule
    return reg.init(self)
end

---@return table
function register:getModule(scriptName)
    for i, v in ipairs(_G.register.scripts) do
        if (i == scriptName) then
            return v.outModule
        end
    end
    return {}
end

do
    Sdk2 = sdk2
    return Sdk2
end

return sdk2
