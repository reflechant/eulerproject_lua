#!/usr/bin/env lua

primes = {2, 3, 5, 7, 11, 13, 17, 19}
factors = {}

for _, v in ipairs(primes) do
	table.insert(factors,v,{v})
end

for i, a in ipairs( {4,6,8,9,10,12,14,15,16,18,20} ) do
	for j, v in ipairs(primes) do
		if a%v == 0 then
			while not (a%v==0) or a>0 do
				a = a / v
				table.insert(factors,a,{v})
			end
		end
	end
end

for i, v in ipairs(factors) do
	io.write(i.."|")
	for j, u in ipairs(v) do
		io.write(u.."")
	end
	io.write("\n")
end
