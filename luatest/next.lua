local a = {o = 1, p = 2, k = 3, q = 4}
local value = nil 
while next(a, value) do
    print(next(a, value))
    print(value)
    value = next(a, value)
    print(value)
end
