coco = coroutine.create(function (a,b)
    print("resume args:"..a..","..b)
    yreturn = coroutine.yield()
    print ("yreturn :"..yreturn)
end)
coroutine.resume(coco,0,1)
coroutine.resume(coco,21)

