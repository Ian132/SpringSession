function love.load(  )
  --Square = {1 = xPos, 2 = yPos, 3 = xVel, 4 = yVel, 5 = Width, 6 = Friction, 7 = Jump Force, 8 = Speed, 9 = Airspeed, 10 = Max Speed, 11 = airborn}
  square = {  {250, 0, 0, 0, 64, 2, 20, 2, 1/2, 10, true},
              {0, 0, 0, 0, 30, 1, 20, 2, 1/2, 10, true}
            }
  --Ball = {1 = xPos, 2 = yPos, 3 = xVel, 4 = yVel, 5 = Width, 6 = Elasticity, 7 = Jump Force, 8 = Speed, 9 = Airspeed, 10 = Max Speed, 11 = airborn}
  ball = {0, 0, 0, 0, 0, 10, 0, 0, 0, 3, true}
  --Floor = {1 = left edge, 2 = hight, 3 = width,}
  floor = { {-1000, 500, 3000},
            {200, 300, 100},
            {500, 300, 100},
            {0, 600, 1}
          }
  --Ceiling
  ceiling = {0, 0, 0}
  g = 1
  speed = 1
end

function squarePhys(a, b)
  --Position
  a[b][1] = a[b][1] + a[b][3]
  a[b][2] = a[b][2] + a[b][4]
  --Floor Check
  for i=1,#floor,1 do
    if( (a[b][1] + (a[b][5] / 2)) > floor[i][1] and (a[b][1] + (a[b][5] / 2)) < (floor[i][1] + floor[i][3]) and (a[b][2] + a[b][5] - a[b][4]) <= floor[i][2] ) then
      if ((a[b][2] + a[b][5]) >= floor[i][2] and a[b][4] > 0) then
        a[b][11] = false
        a[b][2] = floor[i][2] - a[b][5]
      else
        a[b][11] = true
      end
    end
  end
  --Gravity
  if (a[b][11] == true) then
		a[b][4] = a[b][4] + g
  else
    a[b][4] = 0
  end
  --Friction
  if (a[b][11] == false) then
    if (-a[b][6] < a[b][3] and a[b][3] < a[b][6]) then
      a[b][3] = 0
    elseif (a[b][3] > 0) then
      a[b][3] = a[b][3] - a[b][6]
    elseif (a[b][3] < 0) then
      a[b][3] = a[b][3] + a[b][6]
    end
  end
  --Max Speed
  if(a[b][3] > a[b][10]) then
    a[b][3] = a[b][10]
  elseif(a[b][3] < -a[b][10]) then
    a[b][3] = -a[b][10]
  end
end

function love.update( dt )
  for i=1,#square,1 do
    squarePhys(square, i)
  end
  --Player Controls
  if (square[1][11] == true) then
	   if love.keyboard.isDown("right") then
		   square[1][3] = square[1][3] + square[1][9]
	    end
      if love.keyboard.isDown("left") then
        square[1][3] = square[1][3] - square[1][9]
      end
  else
      if love.keyboard.isDown("right") then
 		   square[1][3] = square[1][3] + square[1][8]
 	    end
       if love.keyboard.isDown("left") then
         square[1][3] = square[1][3] - square[1][8]
       end
       if love.keyboard.isDown("up") then
         square[1][4] = -square[1][7]
       end
  end
end

function love.draw(  )
  --SquareDraw
  for i=1,#square,1 do
	   love.graphics.rectangle("fill", square[i][1], square[i][2], square[i][5], square[i][5])
  end
  --RectDraw
    love.graphics.circle("fill", ball[1], ball[2], ball[3])
  --FloorDraw
  for i=1,#floor,1 do
    love.graphics.rectangle("fill", floor[i][1], (floor[i][2] + 10), floor[i][3], 10)
  end
  --CeilingDraw

  --WallDraw

end
