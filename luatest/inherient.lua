-- 当从表t中查找键k时，lua处理如下：
-- 1.t中是否有k，有则直接返回值，否则第2步
-- 2.t是否有元表, 无则返回nil, 有则第3步
-- 3.t的元表是否有__index元方法, 无则返回nil, 有则查找__index指向的表或对应的方法

---注意两种写法
-- 写法1, 可以保持继承链
local class = {}

function class:new()
    self.__index = self
    return setmetatable( {}, self )
end

function class:say()
    print(111)
end

local o1 = class:new()
o1.say()
<<<<<<< HEAD

local o2 = o1:new()
=======
print(type(o1.__index))
local o2 = o1:new()
print(type(o1.__index))
>>>>>>> 1f365973b1152f3d5bde153196ac4addcb75bd87
o2.say()

--- 写法2, 只能继承1次, 第2次派生时没了__index元方法
local class = {}
class.__index = class

function class:new()
    return setmetatable( {}, self )
end

function class:say()
    print(111)
end

local o1 = class:new()
o1.say()

<<<<<<< HEAD
=======
print(type(o1.__index))
>>>>>>> 1f365973b1152f3d5bde153196ac4addcb75bd87
-- 第2次继承失败了, 因为o1并没有__index元方法
local o2 = o1:new()
o2.say()
