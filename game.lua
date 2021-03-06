game = {}

function game:init()
    require("target")

    gameFont = love.graphics.newFont(48)

    target = Target:new()
end

function game:enter(previous)
end

function game:update(dt)
    target:update(dt)
    -- TODO: if score is levels.score and levels.reached then target:speedUp()
end

function game:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.printf("PLAY!", 0, love.graphics.getHeight() - 50, love.graphics.getWidth(), "center")

    target:draw()
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function love.mousepressed(x, y, btn, istouch)
    if Gamestate.current() == game and btn == 1 then
        -- TEMP
        -- target:speedUp()
        dist = distanceBetween(x, y, target:getX(), target:getY())
        if dist < target:getSize() then
            target:hit(math.ceil(dist / 14))
        else
            print("Missed shot")
        end
    end
end