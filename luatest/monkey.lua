local t = {
    name = "hehe",
    __index = {
        money = "900,0000",
    }
}

local mt = {
    __index = {
        money = "900,0000",
    }
}
--setmetatable(t,mt);

print(t.money);
print(t.__index);
print(t.__newindex);
