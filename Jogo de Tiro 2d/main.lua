-- ideia do jogo:

function love.load( ... )
	Object = require "classic"
	Player = require "player"
	Bullet = require "bullet"
	Enemy = require "enemy"
	tile = require "tiles"
	
	player = Player(love.graphics.newImage("Soldier_1/Idle.png"))
	enemy = Enemy(150, 300)
	
	listOfBullets = {}
end

function love.keypressed( key )
	player:keypressed(key)	
end
function love.update( dt )
	player:update(dt)
	enemy.update(enemy, dt)
	for i,v in ipairs(listOfBullets) do
		v:update(dt)
	end
	
end

function love.draw(  )

	for i=1,#tilemap do
			
		for j=1,#tilemap[i] do
			local rectX = j * 1
			local rectY = i * 400
			local rectWidth = 800
			local rectHeight = 25
			if(tilemap[i][j] == 1)then
				love.graphics.setColor(0 , 0.5, 0.4)
				love.graphics.rectangle("fill", rectX, rectY, rectWidth, rectHeight)
			end

				if(player.y+(player.height/2) >= rectY) and
					(player.y <= rectY + rectHeight) and
					(player.x+(player.width) >= rectX) and
					(player.x <= rectX + rectWidth) then
						player.y = rectY - player.height/2
				end
		end
	end
	love.graphics.setColor(1, 1, 1)
	player:draw()
	for i,v in ipairs(listOfBullets) do
		v:draw()
	end
	enemy:draw()
end