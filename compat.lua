-- compat.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 5/14/2019, 2:03:32 PM

local Native = require('lib.native.native')

_G.print = function(...)
    local sb = {}
    for i = 1, select("#", ...) do
        sb[i] = tostring(select(i, ...))
    end
    Native.DisplayTimedTextToPlayer(Native.GetLocalPlayer(), 0, 0, 60, table.concat(sb, "    "))
end

math.random = function(low, up)
    if not low then
        return Native.GetRandomReal(0, 1)
    elseif not up then
        up = low
        low = 1
    end

    if low > up then
        error(2, 'interval is empty')
    end
    if not (low >= 0 or up <= math.maxinteger + low) then
        error(2, 'interval too large')
    end
    return Native.GetRandomInt(low, up)
end

math.randomseed = function(x)
    if math.type(x) ~= 'integer' then
        error(string.format('bad argument #1 to `randomseed` (integer expand)'))
    end
    Native.SetRandomSeed(x)
end
