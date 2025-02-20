local Bullet = Object:extend()

function Bullet:new(x, y)
	self.x = x
	self.y = y
	self.radius = 2
	self.speed = 700
end

function Bullet:update( dt )
	self.x = self.x + self.speed * dt
end

function Bullet:draw( dt )
	love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Bullet