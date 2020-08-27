--[[
    Shooting Gallery
    by greenboyroy

    v0.1.1
    "The First Cleanup"

    -- Main Program --

    Author: Mark Greenwood
    @greenboyroy

    Based on an old university project in 2000 made in Macromedia Director
    but was inspired to remake it by Nintendo's Shooting Gallery game from
    51 Worldwide Games.
]]

-- Making use of Gamestate and Timer from the hump library
-- more info at https://github.com/vrld/hump

Gamestate = require("lib/hump/gamestate")
Timer = require("lib/hump/timer")

require("menu")
require("game")

function love.load()
    love.window.setMode(1280, 720)
    love.window.setTitle('Shooting Gallery')
    -- use nearest-neighbour filtering on up and downscaling to that hard pixel look
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- "seed" the RNG so that calls to random are always random
    -- use the current time, since that will vary on startup every time
    math.randomseed(os.time())

    sprites = {}
    sprites.crosshair = love.graphics.newImage('sprites/crosshair_white_large.png')

    cursor = love.mouse.newCursor('sprites/crosshair_white_large.png', sprites.crosshair:getWidth() / 2, sprites.crosshair:getHeight() / 2)
    love.mouse.setCursor(cursor)
    
    Gamestate.registerEvents()
    Gamestate.switch(menu)

    gridX = {106, 318, 530, 742, 954, 1166}
    gridY = {110, 330, 550}
end