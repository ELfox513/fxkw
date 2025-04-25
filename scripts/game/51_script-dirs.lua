scriptDirs.loadRuntime("/game")

-- [[scriptDirs CMD]]

---@diagnostic disable-next-line: duplicate-set-field
cmd.reload_env = function(a1)
    if (a1 == "?") then
        return {
            pr = "_script-dirs",
            descr = "Reboot ScriptSystem. Also reloads scriptEnvironment",
        }
    end

    S.script:setup()
end
