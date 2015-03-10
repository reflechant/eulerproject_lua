#!/usr/bin/env lua


local function Fibonacci(n)
	local F={1,2}

	while F[#F] <= n do
		table.insert(F,F[#F]+F[#F-1])
	end

	return F
end


local function isEven(x)
	if x%2 == 0 then
		return x
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


local function main()
	io.write( "\n" .. sum( map( Fibonacci(4e6), isEven ) ) .. "\n" )
	
end

main()
