local logger = C.TLog:forTag("fxkw_cmd.lua")

_G.fxkw_cmd = {
    help = function(a1)
        if (a1 == "?") then
            return {
                descr = "Show I2 Foxkitten Workspace cmd help"
            }
        end

        local sorted = {}
        for k, v in pairs(_G.fxkw_cmd) do
            local info = v("?")
            local cmdArgs = info and info.args or nil
            local cmdDescr = info and info.descr or nil
            if cmdArgs == nil then cmdArgs = "" end
            if cmdDescr == nil then cmdDescr = "description not provided" end
            sorted[k] = { args = cmdArgs,  descr = cmdDescr }
        end

        for c, info in utils.pairsByKeys(sorted) do
            logger:i("> fxkw_cmd." .. c .. "[#64B5F6](" .. info.args .. ")\n  [#8BC34A]" .. info.descr)
        end
    end,
}

logger:i("Done")