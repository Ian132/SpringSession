function love.load(  )
	x = 1
	y = 0
	dx = 0
	dy = 1
	tableOfFloors = {{0, 64, 120}}
	airborne = true
end

function love.update( dt )
	x = dx + x
	y = y + dy
	if (airborne) then		
		y = dy + 1

		for i,v in ipairs(tableOfFloors) do
			if	y > v[3] and x > v[1] - 64 and x < v[2] + 64 and y - dy <= v[3]  then
				y = v[3]
				airborne = false
				dy = 0
			else
				airborne = true
			end
		end
	end
	if love.keyboard.isDown("up") then
		dy = -10
	end

	
	if love.keyboard.isDown("right") then
		dx = 1
	elseif love.keyboard.isDown("left") then
		dx = -1
	else
		dx = 0
	end
	
end

function love.draw(  )
	love.graphics.rectangle("fill", x, y, 64, 64)
	love.graphics.rectangle("fill", 0, 64+120, 128, 10)
	if airborne then
		love.graphics.print("hi", 120, 120)
	end
end
