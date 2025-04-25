--[[
    LUA WHITELIST REQUIREMENTS:
    - com.prineside.tdi2.managers.ScriptManager.setup() : void
    - com.prineside.tdi2.Game.scriptManager : ScriptManager
--]]

scriptDirs.loadRuntime("/global", true)

-- [[scriptDirs CMD]]

---@diagnostic disable-next-line: duplicate-set-field
cmd.reload_env = function(a1)
    if (a1 == "?") then
        return {
            pr = "_script-dirs",
            descr = "Reboot ScriptManager. Also reloads globalEnvironment",
        }
    end

    ---@diagnostic disable-next-line: undefined-field
    C.Game.i.scriptManager:setup()
end