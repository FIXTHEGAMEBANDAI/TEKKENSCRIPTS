--[[core.common.stage.lua]]--
--------------------------------------------------------------------------------
-- 1) DEPENDENCIES / REQUIRES
--------------------------------------------------------------------------------
local game  = {

}
game.STAGE_ID = {
    ARENA = 0,
    ARENA2 = 1,
    URBAN = 4,
    URBAN2 = 5,
    YAKUSHIMA = 7,
    COLISEUM = 9,
    REBEL = 11,
    FALLEN = 13,
    DESCENT = 21,
    SANCTUM = 23,
    STRATOSPHERE = 25,
    ORTIZ = 27,
    SEINE = 28,
    SECLUDED = 29,
    ELEGANT = 15,
	SIEGE = 31,
	SEASIDE = 33,
	GENMAJI = 34,
	GENMAJI2 = 35,
	PHEONIX = 45
}

local math_abs   = math.abs
local math_sqrt  = math.sqrt
local math_huge  = math.huge

--------------------------------------------------------------------------------
-- 2) RAW STAGE DATA (NUMERIC ID) WITH 'shape' AND BOUNDS
--------------------------------------------------------------------------------
local stages_raw = {
    -- Arena (octagon)
    [game.STAGE_ID.ARENA] = {
        shape = "octagon",
        vertices = {
            {x=12000, y= 5100},  {x= 5100, y=12000},
            {x=-5100, y=12000},  {x=-12000,y= 5100},
            {x=-12000,y=-5100},  {x=-5100, y=-12000},
            {x= 5100, y=-12000}, {x=12000, y=-5100},
        }
    },
    [game.STAGE_ID.ARENA2] = {
        shape = "octagon",
        vertices = {
            {x=12000, y= 5100},  {x= 5100, y=12000},
            {x=-5100, y=12000},  {x=-12000,y= 5100},
            {x=-12000,y=-5100},  {x=-5100, y=-12000},
            {x= 5100, y=-12000}, {x=12000, y=-5100},
        }
    },

    -- Urban (rect)
    [game.STAGE_ID.URBAN] = {
        shape = "rect",
        vertices = {
            {x= 11800, y=-29750}, {x= 11800, y=-53750},
            {x=-12200, y=-53750}, {x=-12200, y=-29750},
        }
    },
    [game.STAGE_ID.URBAN2] = {
        shape = "rect",
        vertices = {
            {x= 11800, y=-29750}, {x= 11800, y=-53750},
            {x=-12200, y=-53750}, {x=-12200, y=-29750},
        }
    },

    -- Yakushima (octagon)
    [game.STAGE_ID.YAKUSHIMA] = {
        shape = "octagon",
        vertices = {
            {x= 57150, y= 36150}, {x= 60000, y= 36150},
            {x= 60000, y=-38150}, {x= 57150, y=-38150},
            {x=-57150, y=-38150}, {x=-60000, y=-38150},
            {x=-60000, y= 36150}, {x=-57150, y= 36150},
        }
    },

    -- Coliseum (ellipse)
    [game.STAGE_ID.COLISEUM] = {
        shape   = "ellipse",
        originX = 0,
        originY = 0,
        minX    = -29000,
        maxX    =  29000,
        minY    = -35000,
        maxY    =  35000,
    },

    -- Rebel (2F hex, 1F oct)
    [game.STAGE_ID.REBEL] = {
        [0] = { -- 2F
            shape = "hex",
            vertices = {
                {x= 12000, y=-10000}, {x=  8400, y=-30400},
                {x= 12000, y=-34000}, {x=-12000, y=-34000},
                {x=-8400,  y=-30400}, {x=-12000, y=-10000},
            }
        },
        [1] = { -- 1F
            shape = "octagon",
            vertices = {
                {x= 15000, y=  8700}, {x= 12700, y= 11000},
                {x= 12700, y=-11000}, {x= 15000, y= -8700},
                {x=-15000, y= -8700}, {x=-12700, y=-11000},
                {x=-12700, y= 11000}, {x=-15000, y=  8700},
            }
        }
    },

    -- Fallen (rect)
    [game.STAGE_ID.FALLEN] = {
        shape = "rect",
        vertices = {
            {x=  8000, y= 14000}, {x= -8000, y= 14000},
            {x= -8000, y=-14000}, {x=  8000, y=-14000},
        }
    },

    -- Descent (2F rect, 1F oct, B1 rect)
    [game.STAGE_ID.DESCENT] = {
        [0] = { -- 2F
            shape = "rect",
            vertices = {
                {x= 10000, y= 10000}, {x=-10000, y= 10000},
                {x=-10000, y=-10000}, {x= 10000, y=-10000},
            }
        },
        [1] = { -- 1F
            shape = "octagon",
            vertices = {
                {x= 18000, y=  7500}, {x=  7500, y= 18000},
                {x=- 7500, y= 18000}, {x=-18000, y=  7500},
                {x=-18000, y= -7500}, {x=- 7500, y=-18000},
                {x=  7500, y=-18000}, {x= 18000, y= -7500},
            }
        },
        [2] = { -- B1
            shape = "rect",
            vertices = {
                {x= 36000, y= 36000}, {x=-36000, y= 36000},
                {x=-36000, y=-36000}, {x= 36000, y=-36000},
            }
        }
    },

    -- Sanctum (1F rect, 2F rect)
    [game.STAGE_ID.SANCTUM] = {
        [0] = {
            shape = "rect",
            vertices = {
                {x= 30000, y= 10000}, {x=-30000, y= 10000},
                {x=-30000, y=-10000}, {x= 30000, y=-10000},
            }
        },
        [1] = {
            shape = "rect",
            vertices = {
                {x=  8000, y= 24000}, {x=- 8000, y= 24000},
                {x=- 8000, y=-24000}, {x=  8000, y=-24000},
            }
        }
    },

    -- Stratosphere (2F oct, 1F oct)
    [game.STAGE_ID.STRATOSPHERE] = {
        [0] = { -- 2F
            shape = "octagon",
            vertices = {
                {x= 14000, y=  5800}, {x=  5800, y= 14000},
                {x=- 5800, y= 14000}, {x=-14000, y=  5800},
                {x=-14000, y= -5800}, {x=- 5800, y=-14000},
                {x=  5800, y=-14000}, {x= 14000, y= -5800},
            }
        },
        [1] = { -- 1F
            shape = "octagon",
            vertices = {
                {x=  9000, y= 10800}, {x=  6900, y= 12000},
                {x=  6900, y=-12000}, {x=  9000, y=-10800},
                {x=- 9000, y=-10800}, {x=- 6900, y=-12000},
                {x=- 6900, y= 12000}, {x=- 9000, y= 10800},
            }
        }
    },

    -- Ortiz (2F rect, 1F rect, B1 oct)
    [game.STAGE_ID.ORTIZ] = {
        [0] = {
            shape = "rect",
            vertices = {
                {x= 14000, y=  8000}, {x=-14000, y=  8000},
                {x=-14000, y= -8000}, {x= 14000, y= -8000},
            }
        },
        [1] = {
            shape = "rect",
            vertices = {
                {x= 14000, y= 27850}, {x=-14000, y= 27850},
                {x=-14000, y=  7850}, {x= 14000, y=  7850},
            }
        },
        [2] = {
            shape = "octagon",
            vertices = {
                {x= 10000, y= 20710}, {x=  7070, y= 23500},
                {x=- 7070, y= 23500}, {x=-10000, y= 20710},
                {x=-10000, y= 16290}, {x=- 7070, y= 13500},
                {x=  7070, y= 13500}, {x= 10000, y= 16290},
            }
        }
    },

    -- Seine (rect)
    [game.STAGE_ID.SEINE] = {
        shape = "rect",
        vertices = {
            {x=-73000, y=-29000}, {x=-97000, y=-29000},
            {x=-97000, y=-31000}, {x=-73000, y=-31000},
        }
    },

    -- Secluded (rect) - need fix
    [game.STAGE_ID.SECLUDED] = {
        shape = "rect",
        vertices = {
            {x= 10000, y= 54000}, {x=-10000, y= 54000},
            {x=-10000, y=-54000}, {x= 10000, y=-54000},
        }
    },

    -- Elegant (2F rect, 1F hex)
    [game.STAGE_ID.ELEGANT] = {
        [0] = { -- 2F rect
            shape = "rect",
            vertices = {
                {x= 12300, y=-14750}, {x=-11700, y=-14750},
                {x=-11700, y=-16750}, {x= 12300, y=-16750},
            }
        },
        [1] = { -- 1F hex
            shape = "hex",
            vertices = {
                {x= 12150, y= 15350}, {x=-11850, y= 15350},
                {x=-11850, y= -1823}, {x=-11023, y= -2650},
                {x= 11323, y= -2650}, {x= 12150, y= -1823},
            }
        }
    },

    -- Siege (rect)
    [game.STAGE_ID.SIEGE] = {
        shape = "rect",
        vertices = {
            {x=-24500, y= 12000}, {x=-40500, y= 12000},
            {x=-40500, y=-12000}, {x=-24500, y=-12000},
        }
    },

    -- Seaside (rect)
    [game.STAGE_ID.SEASIDE] = {
        shape = "rect",
        vertices = {
            {x=  6000, y= 18000}, {x=-18000, y= 18000},
            {x=-18000, y=-18000}, {x=  6000, y=-18000},
        }
    },

    -- Genmaji (octagon)
    [game.STAGE_ID.GENMAJI] = {
        shape = "octagon",
        vertices = {
            {x= 12000, y=  5100}, {x=  5100, y= 12000},
            {x=- 5100, y= 12000}, {x=-12000, y=  5100},
            {x=-12000, y= -5100}, {x=- 5100, y=-12000},
            {x=  5100, y=-12000}, {x= 12000, y= -5100},
        }
    },
    [game.STAGE_ID.GENMAJI2] = {
        shape = "octagon",
        vertices = {
            {x= 12000, y=  5100}, {x=  5100, y= 12000},
            {x=- 5100, y= 12000}, {x=-12000, y=  5100},
            {x=-12000, y= -5100}, {x=- 5100, y=-12000},
            {x=  5100, y=-12000}, {x= 12000, y= -5100},
        }
    },

    -- Phoenix (1F hex, 2F ellipse)
    [game.STAGE_ID.PHEONIX] = {
        [0] = { -- 1F hex
            shape = "hex",
            vertices = {
                {x=-5200,  y= 12000}, {x=-13000, y=  4800},
                {x=13000,  y= 12000}, {x=13000,  y=-12000},
                {x=-5200,  y=-12000}, {x=-13000, y= -4800},
            }
        },
        [1] = { -- 2F
            shape   = "ellipse",
            originX = 0,
            originY = 0,
            minX    = -60000,
            maxX    =  60000,
            minY    = -50000,
            maxY    =  50000,
        }
    },
}

--------------------------------------------------------------------------------
-- 3) SHAPE-BUILDING HELPER FUNCTIONS
--------------------------------------------------------------------------------
local function make_rect(st)
    local left   = st.originX + st.minX
    local right  = st.originX + st.maxX
    local bottom = st.originY + st.minY
    local top    = st.originY + st.maxY
    return {
        type = "polygon",
        vertices = {
            { x=left,  y=bottom },
            { x=right, y=bottom },
            { x=right, y=top    },
            { x=left,  y=top    },
        },
    }
end

local function make_octagon(st)
    local cx = st.originX
    local cy = st.originY
    local rx = math.min(math_abs(st.minX), math_abs(st.maxX))
    local ry = math.min(math_abs(st.minY), math_abs(st.maxY))
    local R = math.min(rx, ry)  -- radius for regular octagon
    local verts = {}
    for i=0,7 do
        local angle = math.rad(45 * i)
        table.insert(verts, {
            x = cx + R * math.cos(angle),
            y = cy + R * math.sin(angle),
        })
    end
    return { type="polygon", vertices=verts }
end

local function make_ellipse(st)
    local cx = st.originX
    local cy = st.originY
    local a  = math_abs(st.maxX - st.minX) / 2
    local b  = math_abs(st.maxY - st.minY) / 2
    return {
        type = "ellipse",
        cx   = cx,
        cy   = cy,
        a    = a,
        b    = b,
    }
end

--------------------------------------------------------------------------------
-- 4) CONSTRUCT STAGES TABLE
--------------------------------------------------------------------------------
local stages = {}

for id, rawData in pairs(stages_raw) do
    if type(rawData.shape) == "string" then
        -- 단층 스테이지
        if rawData.shape == "ellipse" then
            stages[id] = make_ellipse(rawData)
        else
            -- polygon Mode (rect, octagon, hex 등)
            stages[id] = {
                type     = "polygon",
                vertices = rawData.vertices,
            }
        end
    else
		 -- Layered Stage (e.g. rawData = { [0] = { shape=..., vertices=... }, [1] = {...}, ... })
		 -- Now process to bring unconditional [0]
        local floorData = rawData[0]
        if floorData.shape == "ellipse" then
            stages[id] = make_ellipse(floorData)
        else
            stages[id] = {
                type     = "polygon",
                vertices = floorData.vertices,
            }
        end

        --[[ 
			TODO: After implementing api.stage_level() later,
			local lvl = api.stage_level() -- 0,1,2, etc.
			local floorData = rawData[lvl] 
            ...
        ]]
    end
end

--------------------------------------------------------------------------------
-- 5) RAY-POLYGON / RAY-ELLIPSE INTERSECTION
--------------------------------------------------------------------------------
local function ray_segment_intersect(px, py, dx, dy, p1, p2)
    local ex = p2.x - p1.x
    local ey = p2.y - p1.y
    local det = dx*ey - dy*ex
    if math_abs(det) < 1e-9 then return nil end

    local t = ((p1.x - px)*ey - (p1.y - py)*ex) / det
    if t < 0 then return nil end

    local u = ((p1.x - px)*dy - (p1.y - py)*dx) / det
    if u < 0 or u > 1 then return nil end

    return t
end

local function solve_ellipse(A, B, C)
    local disc = B*B - 4*A*C
    if disc < 0 then return nil end

    local sqrtD = math_sqrt(disc)
    local t1 = (-B + sqrtD)/(2*A)
    local t2 = (-B - sqrtD)/(2*A)
    local tmin = math_huge

    if t1 >= 0 and t1 < tmin then tmin = t1 end
    if t2 >= 0 and t2 < tmin then tmin = t2 end

    return (tmin ~= math_huge) and tmin or nil
end

--------------------------------------------------------------------------------
-- 6) GET_WALL_DISTANCE FUNCTION
--------------------------------------------------------------------------------
local function get_wall_distance(stage, x1, y1, x2, y2)
    -- print("[DEBUG] get_wall_distance called.")
    -- print(string.format("[DEBUG] stage.type = %s", tostring(stage.type)))
    -- print(string.format("[DEBUG] stage data = %s", tostring(stage)))

    local dx, dy = x2 - x1, y2 - y1
    -- print(string.format("[DEBUG] Ray start= (%.2f, %.2f), end= (%.2f, %.2f)", x1, y1, x2, y2))
    -- print(string.format("[DEBUG] Ray dx=%.2f, dy=%.2f", dx, dy))

    local baseLen = math_sqrt(dx*dx + dy*dy)
    if baseLen < 1e-9 then
        print("[DEBUG] baseLen < 1e-9, returning 0.")
        return 0
    end

    if stage.type == "polygon" then
        local minT = math_huge
        for i=1, #stage.vertices do
            local p1 = stage.vertices[i]
            local p2 = stage.vertices[(i % #stage.vertices) + 1]
            local t = ray_segment_intersect(x1, y1, dx, dy, p1, p2)
            if t and t < minT then
                minT = t
            end
        end
        if minT < math_huge then
            local dist = minT * baseLen
            -- print(string.format("[DEBUG] Polygon intersection found, minT=%.4f => distance=%.2f", minT, dist))
            return dist
        end
        -- print("[DEBUG] No polygon intersection found => returning nil.")
        return nil

    elseif stage.type == "ellipse" then
        local sx, sy = x1 - stage.cx, y1 - stage.cy
        local a2, b2 = stage.a*stage.a, stage.b*stage.b
        local A = (dx*dx)/a2 + (dy*dy)/b2
        local B = 2*((sx*dx)/a2 + (sy*dy)/b2)
        local C = (sx*sx)/a2 + (sy*sy)/b2 - 1
        local t = solve_ellipse(A, B, C)
        if t then
            local dist = t * baseLen
            -- print(string.format("[DEBUG] Ellipse intersection found, t=%.4f => distance=%.2f", t, dist))
            return dist
        else
            -- print("[DEBUG] No ellipse intersection found => returning nil.")
            return -1
        end
    end

    print("[DEBUG] Unknown stage type => returning nil.")
    return nil
end

--------------------------------------------------------------------------------
-- 7) API-INTEGRATED FUNCTION
--------------------------------------------------------------------------------
local function wall_distance()
    local sid = getStageId()
    local shape = stages[sid]
    if not shape then
        -- print(string.format("[DEBUG] No shape found for stage_id: %s", tostring(sid)))
        return nil
    end

    local x1, y1 = getLocalPosX(),  getLocalPosY()
    local x2, y2 = getOpponentPosX(), getOpponentPosY()

    local dx = x2 - x1
    local dy = y2 - y1

    local startX = x2
    local startY = y2

    local endX   = x2 + dx
    local endY   = y2 + dy

    -- print(string.format("[DEBUG] wall_distance(vantage=opponent), stage_id=%s", tostring(sid)))
    -- print(string.format("[DEBUG] Ray start= (%.2f, %.2f), end= (%.2f, %.2f) (dx=%.2f, dy=%.2f)",
    --     startX, startY, endX, endY, dx, dy))

    local dist = get_wall_distance(shape, startX, startY, endX, endY)
    if dist == nil then
        return -1
    end
    -- print(string.format("[DEBUG] Wall distance = %s", tostring(dist)))
    return math.floor(dist)
end

--------------------------------------------------------------------------------
-- 8) EXPORT
--------------------------------------------------------------------------------
return {
    stages = stages,
    get_wall_distance = get_wall_distance,
    wall_distance = wall_distance,
}

--[[
Usage Example:
local stage = require("_SDK.stage")
print(stage.wall_distance())
]]--