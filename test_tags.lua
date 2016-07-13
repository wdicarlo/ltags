local tags = require"tags"
local inspect = require"inspect"

local tostring = function (arg)
    if type(arg) == "table" then return inspect(arg) end
    return tostring(arg)
end

print("demo=",tags.demo)
print("hello=",tags.hello)
print("world=",tags.world)
print("ok=",tags.ok)

tags.ok = true
print("ok=",tags.ok)
print(tostring(tags))

local expr = "tags.demo"
print(expr.." --> "..tostring(tags(expr)))
local expr = "tags.ok"
print(expr.." --> "..tostring(tags(expr)))
local expr = "not (tags.hello and tags.world) and tags.ok"
print(expr.." --> "..tostring(tags(expr)))
expr = "(tags.demo or tags.world) and tags.ok"
print(expr.." --> "..tostring(tags(expr)))

tags.demo = true
print("demo=",tags.demo)
print(tostring(tags))

local expr = "tags.demo"
print(expr.." --> "..tostring(tags(expr)))
expr = "(tags.hello or tags.world) and tags.ok"
print(expr.." --> "..tostring(tags(expr)))
expr = "(tags.hello or tags.world) and tags.ok or tags.demo"
print(expr.." --> "..tostring(tags(expr)))
