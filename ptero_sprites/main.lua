-----------------------------------------------------------------------------------------
--
-- main.lua
-- source: http://leetr.com/posts/93/corona-sdk-tutorial-animated-sprite/
-----------------------------------------------------------------------------------------

local sprite = require( "sprite" )
local physics = require( "physics" )

physics.start()
physics.setDrawMode("hybrid")

local pteroSheet = sprite.newSpriteSheet( "ptero_fly_anim.png", 252, 120 )

local pteroSet = sprite.newSpriteSet( pteroSheet, 1, 6 )

sprite.add( pteroSet, "ptero", 1, 6, 300, -2 )

local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
background:setFillColor( 255 )

local ptero = sprite.newSprite( pteroSet )

ptero:setReferencePoint( display.CenterReferencePoint )
ptero.x = display.contentWidth / 2
ptero.y = 0

local rec = display.newRect( 0, 330, display.contentWidth, display.contentHeight-40 )

physics.addBody(ptero, "dynamic", { bounce=0.3, friction=0.3, density=0.2, radius=100 } )
physics.addBody(rec, "static", { bounce=0.3, friction=0.3, density=0.2 })

ptero:prepare( "ptero" )
ptero:play()

