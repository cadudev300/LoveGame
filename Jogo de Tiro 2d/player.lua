local Player = Object:extend()

function Player:new(image)
	self.image = image
	self.x = 150
	self.y = 300
	self.speed = 100
	self.width = image:getWidth() / 7
	self.height = image:getHeight()
	self.origin_x = (self.width/2)
	self.origin_y = (self.height/2)
	self.vida = 150
	self.pontos = 0
	self.frames = {}
	self.currentFrame = 1
end


function Player:keypressed( key )
	bullet = Bullet(self.x, self.y+self.height/4)
	if(key == "1")then
		table.insert(listOfBullets, bullet)
	end
end

function Player:update( dt )
	self.currentFrame = self.currentFrame + 10 * dt	
	if(self.currentFrame >= 8)then
		self.currentFrame = 1
	end


	if(self.x <= 10) then
		self.x = 10
	elseif(self.x >= love.graphics.getWidth())then
		self.x = love.graphics.getWidth()
	end

	if(love.keyboard.isDown("lshift"))then
		self.speed = 300
	else
		self.speed = 100
	end
	
	self.y = self.y + self.speed * dt

	if (love.keyboard.isDown("a"))then
		self.x = self.x - self.speed * dt
		self.image = love.graphics.newImage("Soldier_1/Walk.png")
		for i=0,6 do
			table.insert(self.frames, love.graphics.newQuad(i*self.width, 0, self.width, self.height, image_width, image_height))
		end
	elseif (love.keyboard.isDown("d"))then
		self.x = self.x + self.speed * dt
		self.image = love.graphics.newImage("Soldier_1/Walk.png")
		for i=0,6 do
			table.insert(self.frames, love.graphics.newQuad(i*self.width, 0, self.width, self.height, image_width, image_height))
		end
	else
		self.image = love.graphics.newImage("Soldier_1/Idle.png")

		image_width = self.image:getWidth()
		image_height = self.image:getHeight()

		for i=0,6 do
			table.insert(self.frames, love.graphics.newQuad(i*self.width, 0, self.width, self.height, image_width, image_height))
		end
	end

end


function Player:draw(  )
	love.graphics.draw(self.image, self.frames[math.floor(self.currentFrame)], self.x, self.y, 0, 1, 1, self.origin_x, self.origin_y)
	love.graphics.print("Vida do player " .. math.floor(self.vida), 0, 20)
	love.graphics.print("player pontos " .. math.floor(self.pontos), 0, 40)
		if(self.vida <= 0 ) then
			self.speed = 0
			love.graphics.print("VOCE Perdeu !!", 350, 400, 0, 2)
		end
end

return Player