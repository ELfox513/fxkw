local logger = C.TLog:forTag("game/fxkw_cmd.lua")

fxkw_cmd.reload_scriptSystem = function(a1)
    if (a1 == "?") then
        return {
            descr = "Reboot ScriptSystem. Also reloads scriptEnvironment"
        }
    end

    S.script:setup()
end

logger:i("Done")