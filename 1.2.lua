#!/usr/bin/env lua


local function range(a,b)
	T = {}
	for i = a,b do
		table.insert( T, i )
	end
	return T
end

local function div(x)
	return function(y)
		if y%x == 0 then return y
		end
	end
end

local function sum(t)
    local sum = 0
    for i,v in pairs(t) do
        sum = sum + v
    end
    return sum
end

local function map(t,func)
    local T = {}
    for k,v in pairs(t) do
        --table.insert(T,func(v))
        T[k] = func(v)
    end
    return T
end 

io.write("\n".. sum( map( range(1,999), function (x) if div(3)(x) or div(5)(x) then return x end end ) ) .."\n")
