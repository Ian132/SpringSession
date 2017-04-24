function love.load(  )
	x = 0
	y = 0
	tableOfFloors = {{64, 64, 24}}
	airborne = true
end

function love.update( dt )
	if (airborne) then
		y = y + 1
	end
	for i,v in ipairs(tableOfFloors) do
		if	y > tableOfFloors[3] then
			y = tableOfFloors[3]
			airborne = false
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
