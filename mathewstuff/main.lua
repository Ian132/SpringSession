function love.load(  )
  --{1 = xpos, 2 = ypos, 3 = xVel, 4 = yVel, 5 = xWidth, 6 = yWidth, 7 = Friction, 8 = Jump Force}
  player = {0, 0, 0, 0, 64, 64, 1, 20}
  ball = {0, 0, 0, 0, 10, 10, 1}
	Ground = 500
  g = 1
	airborne = true
  speed = 1
end

function physics(a)
  --Position
  a[1] = a[1] + a[3]
  a[2] = a[2] + a[4]
  --Airborne Check
  if ((a[2] + a[6]) >= Ground and a[4] >= 0) then
    airborne = false
    speed = 2
  else
    airborne = true
    speed = 1/2
  end
  --Gravity
  if (airborne) then
		a[4] = a[4] + g
  else
    a[4] = 0
  end
  --Friction
  if (a[3] > 0 and airborne == false) then
    a[3] = a[3] - a[7]
  end
  if (a[3] < 0 and airborne == false) then
    a[3] = a[3] + a[7]
  end
end

function love.update( dt )
  physics(player)
  --Player Controls
	if love.keyboard.isDown("right") then
		player[3] = player[3] + speed
	end
  if love.keyboard.isDown("left") then
    player[3] = player[3] - speed
  end
  if love.keyboard.isDown("up") and airborne == false then
    player[4] = player[4] - player[8]
  end
end

function love.draw(  )
	love.graphics.rectangle("fill", player[1], player[2], player[5], player[6])
  love.graphics.circle("fill", ball[1], ball[2], ball[3])
  love.graphics.rectangle("fill", 0, (Ground + 5), 1000, 10)
end
