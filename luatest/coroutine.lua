coco = coroutine.create(function (a,b)
    print("resume args:"..a..","..b)
    yreturn = coroutine.yield()
    print ("yreturn :"..yreturn)
end)
coroutine.resume(coco,0,1)
coroutine.resume(coco,21)

coco2 = coroutine.wrap(function (a,b)
    print("resume args:"..a..","..b)
    yreturn = coroutine.yield()
    print ("yreturn :"..yreturn)
end)
print(type(coco2))
coco2(0,1)
coco2(21)

function status()
    print("co1's status :"..coroutine.status(co1).." ,co2's status: "..coroutine.status(co2))
end

co1 = coroutine.create(function ( a )
    print("arg is :"..a)
    status()
    local stat,rere = coroutine.resume(co2,"2")
    print("resume's return is "..rere)
    status()
    local stat2,rere2 = coroutine.resume(co2,"4")
    print("resume's return is "..rere2)
    local arg = coroutine.yield("6")
end)
co2 = coroutine.create(function ( a )
    print("arg is :"..a)
    status()
    local rey = coroutine.yield("3")
    print("yeild's return is " .. rey)
    status()
    coroutine.yield("5")
end)
--主线程执行co1,传入字符串“main thread arg”
stat,mainre = coroutine.resume(co1,"1")
status()
print("last return is "..mainre)

function foo(a)
    print("foo", a)
    return coroutine.yield(2 * a)
end

co = coroutine.create(function ( a, b )
    print("co-body", a, b)
    local r = foo(a + 1)
    print("co-body", r)
    local r, s = coroutine.yield(a + b, a - b)
    print("co-body", r, s)
    return b, "end"
end)

print("main", coroutine.resume(co, 1, 10))
print("main", coroutine.resume(co, "r"))
print("main", coroutine.resume(co, "x", "y"))
print("main", coroutine.resume(co, "x", "y"))
print("main", coroutine.resume(co, "x", "y"))
print("main", coroutine.resume(co, "x", "y"))
