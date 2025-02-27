local menu_ = require('_SDK.sdk2').Menu

local menu = {}


function menu.setCacheName(name)
    if (name == "") then menu_.setCacheName("", "") end
    local info = debug.getinfo(2)
    local path = info.source:sub(2, info.source:len() - info.source:reverse():find('\\') + 1)
    menu_.setCacheName(name, path)
end

---@param name string
---@param V_bool boolean
---@return boolean
function menu.checkbox(name, V_bool)
    return menu_.checkbox(name, V_bool)
end

function menu.sameLine() core.menu.SameLine() end

function menu.separator() core.menu.Separator() end

---@param value string
function menu.text(value) menu_.text(value) end

---@param value string
function menu.help(value) menu_.help(value) end

---@param value string
---@return boolean
function menu.button(value) return menu_.button(value) end

---@param value string
function menu.pushID(value) core.menu.PushID(value) end

function menu.popID() return core.menu.PopID() end

---@param name string
---@param V_float number
---@param min number
---@param max number
---@return number
function menu.sliderFloat(name, V_float, min, max)
    return menu_.sliderFloat(name, V_float, min, max)
end

---@param name string
---@param V_int number
---@param min number
---@param max number
---@return number
function menu.sliderInt(name, V_int, min, max)
    return menu_.sliderInt(name, V_int, min, max)
end

---@param name string
---@param V_int number
---@param comboData table<string>
---@return number
function menu.combo(name, V_int, comboData)
    return menu_.combo(name, V_int, comboData)
end

---@param name string
---@param V_rgba table
---@return table
function menu.colorEdit(name, V_rgba)
    return menu_.colorEdit(name, V_rgba)
end

---@param name string
---@param V_int number
---@return number
function menu.keySelect(name, V_int)
    return menu_.keySelect(name, V_int)
end

return menu
