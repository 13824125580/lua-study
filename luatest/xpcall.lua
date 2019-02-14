function traceback( msg )
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
	print("hello")
        yreturn = coroutine.yield()
	return yreturn
end


coco = coroutine.create(function (a,b)
    print("resume args:"..a..","..b)
    yr = xpcall(main, traceback)
    print ("yreturn :"..yreturn)
end)
coroutine.resume(coco,0,1)
coroutine.resume(coco,21)

