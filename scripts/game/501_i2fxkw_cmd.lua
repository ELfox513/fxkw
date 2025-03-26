local logger = C.TLog:forTag("game/i2fxkw_cmd.lua")

i2fxkw_cmd.reload_scriptSystem = function(a1)
    if (a1 == "?") then
        return {
            descr = "Reboot ScriptSystem. Also reloads scriptEnvironment"
        }
    end

    S.script:setup()
end