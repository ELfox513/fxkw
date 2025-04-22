--[[
    LUA WHITELIST REQUIREMENTS: 
    - com.badlogic.gdx.files.FileHandle.FileHandle(arg0: Strung) --> WHITELIST
    - com.badlogic.gdx.files.FileHandle.list() : FileHandle[] --> WHITELIST
    - com.badlogic.gdx.files.FileHandle.path() : String --> WHITELIST
--]]

local FileHandle = luajava.bindClass("com.badlogic.gdx.files.FileHandle")

local tiles = FileHandle.new_S("scripts/fxkw/maped_plugins/"):list()
for _, tile in dipairs(tiles) do
    print(tile:path())
end