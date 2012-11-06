
-- llamamos motor de fisica
local physics = require("physics")
physics.start()
physics.setGravity(0,4.9)

system.activate("multitouch")

display.setStatusBar(display.HiddenStatusBar)

--physics.setDrawMode("hybrid")

--fondo
local background = display.newImage("bkg_clouds.png")

-->ballon1
local ballon = display.newImage("ball1.png")
ballon.x = display.contentWidth/2
physics.addBody(ballon,{bounce = 0.5,friction=1.0} )

--ballon2
local ballon2 = display.newImage("ball2.png")
ballon2.x = ballon.x - 105
physics.addBody(ballon2,{bounce = 0.5,radius = 42,friction=1.0} )

--ballon3
local ballon3 = display.newImage("ball4.png")
ballon3.x = ballon.x + 105
physics.addBody(ballon3,{bounce = 0.5,radius = 42,friction=1.0} )

local floor =display.newImage("ground.png")
floor.y = display.contentHeight - floor.stageHeight/2
physics.addBody(floor,"static",{bounce = 0.0, friction=10})

local foot = display.newImage("groundFront.png")
foot.y = (display.contentHeight - foot.stageHeight/2)+5



-- wall
local leftWall = display.newRect(0, 0, 1,display.contentHeight)
local rightWall = display.newRect(display.contentWidth,0,1,display.contentHeight)
local ceiling = display.newRect(0, 0, display.contentWidth,1)


--turn wall
physics.addBody(leftWall,  "static", { bounce = 0.1})
physics.addBody(rightWall, "static", { bounce = 0.1})
physics.addBody(ceiling,   "static", { bounce = 0.1})


--piso 



--evento del ballon
function moveBalloon(event)
	local ballon = event.target
	ballon:applyLinearImpulse(0,-0.2, event.x, event.y)
end

-- a cada elemento le asignamos un listener
ballon:addEventListener("touch", moveBalloon)
ballon2:addEventListener("touch", moveBalloon)
ballon3:addEventListener("touch", moveBalloon)
 





