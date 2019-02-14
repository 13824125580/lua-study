function add(x)
    x = 5
    local m = 1
    local n = 1
    local p = 1 
    local q = 1
    local o = 1
    local j = 1
    local l = 1
    return function(y)
	print("xsd")
        return x+y + m +n + q +o + l
    end
end

add2 = add(2)
add2(5)
--print(add2(5))
