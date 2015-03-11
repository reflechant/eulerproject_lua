#!/usr/bin/env lua


--[[local mt = {
	__tostring = function (t)

		keys = {}
		for k,_ in pairs(t) do
			table.insert(keys,k)
		end
		table.sort(keys)
		
		return "{"..table.concat(t,",").."}"
	end
}]]--

local function isPrime (x,pt)
	for _,v in ipairs(pt) do
		if x%v == 0 then return false end
	end
	return true
end

local function getPrime ()
	local P = {2}
	local i = 0
	return function ()
		local x = P[#P]
		while true do
			x = x + 1
			if isPrime(x,P) then
				table.insert(P,x)
				i = i + 1
				return P[i]
			end
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

local function getFactors (n,prgen)
	local F = {}
	local pr = prgen()
	
	while n>1 do
		local x = pr()
		F[x],n = divtimes(n,x)
		--[[a,b = divtimes(n,x)
		n = b
		table.insert(F,{x,a})]]--
		--print(x,F[x],n)
		--print(F)
	end
	--setmetatable(F,mt)
	return F
end

--[[local function printF (t)
	io.write("\n{")
	for  in pairs(t) do
		io.write("{")
	end
	io.write("}\n")
end]]--

--[[pr = getPrime()
P = {}
setmetatable(P,mt)
for i = 1,15 do
	--table.insert(P,pr())
	P[i] = pr()
end
print(P)]]--

--print( getFactors(600851475143,getPrime ) )
t = getFactors(600851475143,getPrime )

local keys = {}
for k,_ in pairs(t) do
	table.insert(keys,k)
end
table.sort(keys)
print(keys[#keys])
--[[for _,v in pairs(keys) do
	print(v,t[v])
end]]--

