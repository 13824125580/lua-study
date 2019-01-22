function mem()
	print("call the gc collect")
	local c2 = collectgarbage("count")
	collectgarbage("collect")
	print("after collect memory is ", c2)
end
function test2()
	collectgarbage("collect")
	local c1 = collectgarbage("collect")
	print("from the beginning lua memory:", c1)
	colen = {}
	print("now, declare 50000 arrary add to colen")
	for i = 1, 5000 do
		table.insert(colen, {})
	end
	local c2 = collectgarbage("count")
	print("now the memory:", c2)
end

test2()
mem()
mem()
mem()
mem()
