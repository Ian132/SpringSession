function love.load(  )
	x = 1
	y = 0
	dx = 0
	dy = 1
	tableOfFloors = {{64, 64, 24}}
	airborne = true
end

function love.update( dt )
	x = dx + x


	if (airborne) then
		y = y + dy
	end
	for i,v in ipairs(tableOfFloors) do
		if	y > v[3] and x > v[1] - 64 and x < v[2] + 64 and y - 2 < v[3]  then
			y = v[3]
			airborne = false
		else
			airborne = true
		end
	end
	if love.keyboard.isDown("right") then
		dx = 1
	elseif love.keyboard.isDown("left") then
		dx = -1
	else
		dx = 0
	end
	if love.keyboard.isDown("up") then
		dy = -1
	else
		dy = 1
	end
end

function love.draw(  )
	love.graphics.rectangle("fill", x, y, 64, 64)
	love.graphics.rectangle("fill", 0, 64+24, 128, 10)
end
