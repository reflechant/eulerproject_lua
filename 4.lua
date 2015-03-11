#!/usr/bin/env lua


local mt = {
	__tostring = function (t)
        return "{"..table.concat(t,",").."}"
    end
}

local function getProducts (digits)
	local products = {}
	for i = 10^(digits-1), 10^digits-1 do
		for j = i, 10^digits-1 do
			table.insert(products,i*j)
		end
	end
	setmetatable(products,mt)
	return products
end

local function map (t,func)
	local T = {}
	for k,v in pairs(t) do
		T[k] = func(v)
	end
	setmetatable(T,mt)
	return T
end

local function sortPalindromes (t)
	local P = {}
	for _,v in pairs(t) do
		if tostring(v) == tostring(v):reverse() then table.insert(P,v) end
	end
	setmetatable(P,mt)
	return P
end


local function max (t)
	table.sort(t)
	return t[#t]
end


local function last (t)
	return t[#t]
end

print( max( sortPalindromes( getProducts(3) ) ) )
