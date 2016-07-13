local inspect = require"inspect"

local tostring = function (arg)
    if type(arg) == "table" then return inspect(arg) end
    return tostring(arg)
end

local tags = {
    status = {}
}

local tags_mt = {
    __index = function(self,key)
        local status = rawget(self,"status")
        if status[key] == nil then
            status[key] = false
        end
        return status[key]
    end,
    __newindex = function(self,key,value)
        assert(type(value) == "boolean")
        local status = rawget(self,"status")
        status[key] = value
        return status[key]
    end,
    __call = function(self, expr)
            assert(type(expr) == "string" )
            local func, err = loadstring("return function (tags) return "..expr.." end")
            if func then
                local ok, f = pcall(func,self)
                if ok then
                    return f(self)
                end
            else
                print("Error loading function: "..err)
            end
    end
}

setmetatable(tags,tags_mt)

return tags
