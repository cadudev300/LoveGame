local Enemy = Object.extend(Object)

function Enemy:new()
	self.x = 200
	self.y = 300
	self.image = love.graphics.newImage("Wild Zombie/Idle.png")
	self.image_width = self.image:getWidth()
	self.image_Height = self.image:getHeight()
	self.width = self.image_width/8
	self.height = self.image_Height 
	self.speed = 150
	self.vida = 100
	frames = {}
	currentFrames = 1
end
 
	function Enemy:update( dt )	
		currentFrames = currentFrames + 5 * dt
		if(currentFrames >= 9)then
			currentFrames = 1
		end
		self.image = love.graphics.newImage("Wild Zombie/Run.png")
			for i=0,7 do
				table.insert(frames,love.graphics.newQuad(i*self.width, 0, self.width, self.height, self.image_width, self.image_Height))
			end
		self.x = self.x + self.speed * dt
		if(self.x+self.width/1.3 >= love.graphics.getWidth())then
			self.speed = -self.speed
			self.image = love.graphics.newImage("Wild Zombie/Run.png")
			for i=0,7 do
				table.insert(frames,love.graphics.newQuad(i*self.width, 0, self.width, self.height, self.image_width, self.image_Height))
			end
		elseif(self.x <= 0)then
			self.speed = -self.speed
		end

		for i,v in ipairs(listOfBullets) do
		if (self.x + self.width >= v.x) and
			(self.x <= v.x + v.radius) and
			(self.y + self.height >= v.y) and
			(self.y <= v.y + v.radius) then
			self.vida = self.vida - 10 * dt
				player.pontos = player.pontos + 1 		
		end
	end

	if (self.x + self.width >= player.x) and
		(self.x <= player.x + player.width/4) and			
		(self.y + self.height >= player.y) and
		(self.y <= player.y + player.height) then
			player.vida = player.vida - 50 * dt
	end
end

function Enemy:draw(  )	
	love.graphics.draw(self.image, frames[math.floor(currentFrames)], self.x, self.y )
	love.graphics.print("vida do inimigo: " .. math.floor(self.vida))
		if(self.vida <= 0 ) then
			self.speed = 0
			love.graphics.print("VOCE GANHOU !!", 350, 400, 0, 2)
		end
end

return Enemy