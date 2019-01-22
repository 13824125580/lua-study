function trace (event, line)
    local s = debug.getinfo(2).short_src
    print(s .. ":" .. line)
end

function call (event)
    print("call happen")
end

function rt (event)
    print("return happen")
end

function count (event)
    print("count happen")
end
    
debug.sethook(trace, "l")
--debug.sethook(call, "c")
--debug.sethook(rt, "r")
--debug.sethook(count, "count")
print("a")
print("a")
print("a")
print("a")
print("a")
