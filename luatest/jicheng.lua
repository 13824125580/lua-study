Object = {class_id = 0}
function Object:new(o)
    o = o or {}
    setmetatable(o,self) -- 对象o调用不存在的成员时都会去self中查找，而这里的self指的就是Object
    self.__index = self
return o
end

---以下我们创建对象来测试以下
local o1 = Object:new()
o1.class_id = 11
local o2 = Object:new()
o2.class_id = 22

DisplayObject = Object:new()
-- 现在为止，DisplayObject只是Object的一个实例，注意以下代码

D = DisplayObject:new()

-- DisplayObject从Object继承了new方法，当new执行的时候，self参数指向DisplayObject。所以，D的metatable是DisplayObject，__index 也是DisplayObject。这样，D继承了DisplayObject，后者继承了Object。

---在Lua中面向对象有趣的一个方面是你不需要创建一个新类去指定一个新的行为。
