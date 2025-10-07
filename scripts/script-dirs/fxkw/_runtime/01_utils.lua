-- some useful funcs

-- for parse userdata arrays
utils.dipairs = function(aa)
    return function(a, i)
        i = i+1
        local v = i <= #a and a[i]
        if v then return i, v end
    end, aa, 0
end