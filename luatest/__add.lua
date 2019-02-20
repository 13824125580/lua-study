local mt = {}

mt.__add = function(a,b)
    coroutine.yield()
    print("yield resume")
    return a.v + b.v/2
end

local a = {v = 10}
local b = {v = 12}

setmetatable(a, mt)

function traceback( msg )
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
	print("hello")
        print("a + b :", a + b)
end

local function main_()
        return xpcall(main, traceback)
end


coco = coroutine.create(function (a,b)
    print("resume args:"..a..","..b)
    ab, yr = xpcall(main_, traceback)
    print ("yreturn and ab:" ..yreturn, ab)
end)
coroutine.resume(coco,0,1)
coroutine.resume(coco,21)

