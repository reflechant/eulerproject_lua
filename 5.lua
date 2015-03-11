#!/usr/bin/env lua

local mt = {
	__tostring = function (t)
		return "{"..table.concat(t,",").."}"
	end
}

local function rangegen ()
	local x = 0
	return function ()
		while x < 21 do
			x = x + 1
			return x
		end
	end
end

local function divtimes (n,x)
	local t = 0
	while n%x == 0 do
		n = n / x
		t = t + 1
	end
	if t == 0 then t = nil end
	return t,n
end

local function getFactors (n,gen)
	local F = {}
	local pr = gen()
	
	while n>1 do
		local x = pr()
		F[x],n = divtimes(n,x)
	end
	setmetatable(F,mt)
	print(F)
	return F
end

local function divisible_by_all (factors)
	local keys = {}
	for k,_ in pairs(factors) do
		table.insert(keys,k)
	end
	table.sort(keys)
	for i,v in ipairs(keys) do
		if i ~= v then return false end
	end
	return true
end

local function main ()
	local i = 2  
	while true do
		if divisible_by_all( getFactors(i,rangegen) ) then
			return i
		end
		i = i + 1
	end
end

print( main() )
