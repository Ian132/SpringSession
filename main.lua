function love.load(  )
  --{1 = xpos, 2 = ypos, 3 = xVel, 4 = yVel, 5 = xWidth, 6 = yWidth, 7 = Friction, 8 = Jump Force}
  Player = {0, 0, 0, 0, 64, 64, 1, 20}
	Ground = 500
  g = 1
	airborne = true
  speed = 1
end

function love.update( dt )
  --Position
  Player[1] = Player[1] + Player [3]
  Player[2] = Player[2] + Player [4]
  --Airborne Check
  if ((Player[2] + Player[6]) >= Ground and Player[4] >= 0) then
    airborne = false
    speed = 2
  else
    airborne = true
    speed = 1/2
  end
  --Gravity
  if (airborne) then
		Player[4] = Player[4] + g
  else
    Player[4] = 0
  end
  --Friction
  if (Player[3] > 0 and airborne == false) then
    Player[3] = Player[3] - Player[7]
  end
  if (Player[3] < 0 and airborne == false) then
    Player[3] = Player[3] + Player[7]
  end
  --Player Controls
	if love.keyboard.isDown("right") then
		Player[3] = Player[3] + speed
	end
  if love.keyboard.isDown("left") then
    Player[3] = Player[3] - speed
  end
  if love.keyboard.isDown("up") and airborne == false then
    Player[4] = Player[4] - Player[8]
  end
end

function love.draw(  )
	love.graphics.rectangle("fill", Player[1], Player[2], Player[5], Player[6])
  love.graphics.rectangle("fill", 0, (Ground + 5), 1000, 10)
end
