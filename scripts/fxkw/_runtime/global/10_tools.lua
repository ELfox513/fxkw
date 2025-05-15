-- [[scriptDirs CMD]]

cmd.quad_builder = function(a1)
    if (a1 == "?") then
        return { pr = fxkw.cmdPrefix, descr = "Shows Quad Builder tool", }
    end

    dofile("scripts/fxkw/tools/quad-builder.lua")
end

dofile("scripts/fxkw/tools/quad-builder.lua")