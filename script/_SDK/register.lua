register = {}
register.scripts = {}
register.errorcode = ""
register.init = function(data)
    if (not data.name or data.name == "") then
        register.errorcode = "must set name"
        return false
    end
    for i, v in pairs(register.scripts) do
        if (i == data.name) then
            return
        end
    end
    register.scripts[data.name] = data
    core.script.registerScript(data)
    return true
end
register.unload = function()
    for i, v in pairs(register.scripts) do
        if (v.unload) then v.unload() end
    end
    register.scripts = {}
    for key, _ in pairs(package.preload) do
        package.preload[key] = nil
    end
    for key, _ in pairs(package.loaded) do
        package.loaded[key] = nil
    end
    print("cls")
end

return register
