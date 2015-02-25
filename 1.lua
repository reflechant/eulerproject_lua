#!/usr/bin/env lua


local s = 0

for i = 1, 999 do
	if i % 3 == 0 or i % 5 == 0 then
		s = s + i
	end
end

io.write( s .. "\n" )
