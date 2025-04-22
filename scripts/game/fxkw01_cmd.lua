local logger = C.TLog:forTag("game/fxkw_cmd.lua")

local prefix = "fxkw"

cmd.reload_script_sys = function(a1)
    if (a1 == "?") then
        return {
            prefix = prefix,
            descr = "Reboot ScriptSystem. Also reloads scriptEnvironment",
        }
    end

    S.script:setup()
end

logger:i("Done")