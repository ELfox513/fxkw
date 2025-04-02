--[[
    LUA WHITELIST REQUIREMENTS: 
    - com.prineside.tdi2.managers.ScriptManager.setup() : void --> WHITELIST
    - com.prineside.tdi2.Game.scriptManager --> WHITELIST
--]]

local logger = C.TLog:forTag("global/fxkw_cmd.lua")

fxkw_cmd.reload_scriptManager = function(a1)
    if (a1 == "?") then
        return {
            descr = "Reboot ScriptManager. Also reloads globalEnvironment"
        }
    end

    ---@diagnostic disable-next-line: undefined-field
    C.Game.i.scriptManager:setup()
end

logger:i("Done")