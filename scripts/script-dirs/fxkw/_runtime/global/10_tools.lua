local logger = C.TLog:forTag("cmd.lua")

-- [[scriptDirs CMD]]

local quad_viewer_wnd = nil
cmd.quad_viewer = function(quad)
    if (quad == "?") then
        return {
            pr = fxkw.cmdPrefix,
            args = "Quad obj",
            descr = "Shows Quad Viewer tool for specified quad",
        }
    end

    if quad and quad.getClass and quad:getClass() == C.Quad then
        dofile_fxkw("tools/quad-viewer.lua")(quad)
    else
        logger:e("bad argument: expected Quad, got something else")
    end
end