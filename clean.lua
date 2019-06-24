require('lib.native.compat')

for _, v in ipairs(require('lib.native.globals')) do
    _G[v] = nil
end
