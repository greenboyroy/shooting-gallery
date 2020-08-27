Target = {}

function Target:new()
    local obj = {
        x = 0,
        y = 0,
        size = 75,
        state = "init",
        timer = Timer.new(),
        life = 1,
        values = {100, 75, 50, 20, 10, 0}
    }
    setmetatable(obj, { __index = Target })
    return obj
end

function Target:update(dt)
    self.timer:update(dt)
    if string.match(self.state, "missed")
      or string.match(self.state, "hit") 
      or string.match(self.state, "init") then
        self:spawn()
    end
end

function Target:draw()
    if string.match(self.state, "live") then
        love.graphics.setColor(1,0,0)
        love.graphics.circle('fill', self.x, self.y, self.size)
    end
end

function Target:spawn()
    self.x = gridX[math.random(1, #gridX)]
    self.y = gridY[math.random(1, #gridY)]
    self.state = "live"
    self.timer:after(self.life, function() self:miss() end)
end

function Target:hit()
    self.state = "hit"
    self.timer:clear()
    -- add X to score
end

function Target:miss()
    print("Missed target")
    self.state = "missed"
    self.timer:clear()
    -- add 1 to misses
end

function Target:speedUp()
    self.life = self.life * 0.95
end

function Target:getX()
    return self.x
end

function Target:getY()
    return self.y
end

function Target:getSize()
    return self.size
end

function Target:getValue(ring)
    return self.values[ring]
end

-- self.img... image file to use (different values = different image)
-- 