tbl = {"alpha", "beta", [3] = "uno", ["two"] = "dos"}
 
--for i,v in ipairs(tbl) do    --输出前三个
    --print( tbl[i] )
--end
 
for i,v in pairs(tbl) do    --全部输出
    print( tbl[i] )
end
