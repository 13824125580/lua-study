 local t1 = {}
function t1.showInfo()
    print("t1.showInfo Method")
end

local t2 = {}
setmetatable(t2, {__index = t1})

local b="nestw"
setmetatable(b, {__index = t1})
t2.showInfo()
