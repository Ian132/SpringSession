function love.load(  )
	x = 1
	y = 0
	dx = 0
	dy = 1
	tableOfFloors = {{64, 64, 24}}
	airborne = true
end

function love.update( dt )
	if (airborne) then
		y = y + dy
	end
	for i,v in ipairs(tableOfFloors) do
		if	y > v[3] and x > v[1] - 64 and x < v[2] + 64 then
			y = v[3]
			airborne = false
		else
			airborne = true
		end
	end
	if love.keyboard.isDown("right") then
		x = x + 1
	end
	if love.keyboard.isDown("left") then
		x = x - 1
	end
end

function love.draw(  )
	love.graphics.rectangle("fill", x, y, 64, 64)
end
