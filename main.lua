function love.load(  )
	x = 1
	y = 0
	dx = 0
	dy = 0
	bx = 0
	by = 0
	bdx = 0
	bdy = 0
end

function love.update( dt )
	x = dx + x
	y = dy + y
	bx = bdx + bx
	by = bdy + by
	if love.keyboard.isDown("down") then
		dy = dy + 1
	elseif love.keyboard.isDown("up") then
		dy = dy - 1
	else
		if dy > 0 then
			dy = dy - 1
		elseif dy < 0 then
			dy = dy + 1
		end
	end
	if love.keyboard.isDown("right") then
		dx = dx + 1
	elseif love.keyboardIsDown("up") then
		dx = dx - 1
	end

end

function love.draw(  )
	love.graphics.rectangle("fill", x, y, 64, 64)
	love.graphics.rectangle("fill", bx, by, 10, 10)
end