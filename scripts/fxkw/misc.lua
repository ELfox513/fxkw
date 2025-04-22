-- some useful funcs

local function dinext(a, i)
    i = i+1
    local v = i <= #a and a[i]
    if v then return i, v end
end

function dipairs(a)
    return dinext, a, 0
end