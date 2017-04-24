function love.load(  )
	x = 0
	y = 0
end

function love.update( dt )
	x = x + 1
	y = y + 1
end

function love.draw(  )
	love.graphics.rectangle("fill", x, y, 64, 64)
end