menu = {}

function menu:init()
    -- eg. set background, fonts, variables etc.
    menuFont = love.graphics.newFont(40)
    print("menu")
end

function menu:enter(previous) -- runs every time the state is entered
end

function menu:update(dt) -- runs every frame
end

function menu:draw()
    love.graphics.setFont(menuFont)
    love.graphics.printf("Press enter to continue", 0, 50, love.graphics.getWidth(), "center")
end

function menu:keyreleased(key, code)
    if key == 'up' then
        print("Up")
    elseif key == 'down' then
    elseif key == 'return' then
        Gamestate.switch(game)
    end
end

function menu:mousereleased(x, y, mouse_btn)
    Gamestate.switch(game)
end