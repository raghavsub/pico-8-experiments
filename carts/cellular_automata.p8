pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- cellular automata
-- by imabearlol

function _init()
	data = {}
	for i=1, 128 do
		data[i] = 0
	end
	data[1] = 1
	y = 0
	cls()
end

function _update()
end

function _draw()
	-- draw data
	for i=1, 128 do
		if data[i] == 1 then
			x = i - 1
			pset(x, y, 7)
		end
	end

	-- update data and y
	new_data = {}
	if data[128] == 1 and data[1] == 0 and data[2] == 0 then
		new_data[1] = 1
	elseif data[128] == 0 and data[1] == 1 and data[2] == 1 then
		new_data[1] = 1
	elseif data[128] == 0 and data[1] == 1 and data[2] == 0 then
		new_data[1] = 1
	elseif data[128] == 0 and data[1] == 0 and data[2] == 1 then
		new_data[1] = 1
	else
		new_data[1] = 0
	end
	for i=2, 127 do
		if data[i-1] == 1 and data[i] == 0 and data[i+1] == 0 then
			new_data[i] = 1
		elseif data[i-1] == 0 and data[i] == 1 and data[i+1] == 1 then
			new_data[i] = 1
		elseif data[i-1] == 0 and data[i] == 1 and data[i+1] == 0 then
			new_data[i] = 1
		elseif data[i-1] == 0 and data[i] == 0 and data[i+1] == 1 then
			new_data[i] = 1
		else
			new_data[i] = 0
		end
	end
	if data[127] == 1 and data[128] == 0 and data[1] == 0 then
		new_data[128] = 1
	elseif data[127] == 0 and data[128] == 1 and data[1] == 1 then
		new_data[128] = 1
	elseif data[127] == 0 and data[128] == 1 and data[1] == 0 then
		new_data[128] = 1
	elseif data[127] == 0 and data[128] == 0 and data[1] == 1 then
		new_data[128] = 1
	else
		new_data[128] = 0
	end
	data = new_data
	y = y + 1
	if y == 128 then
		y = 0
		cls()
	end
end
