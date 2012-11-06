-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require("physics")
physics.start()
physics.setScale(40)

--physics.setDrawMode("hybrid")

local game = display.newGroup()

local bg = display.newImage("cloud.png",-300,0)
game:insert(bg)

local pik = display.newImage("pik.png",-250,0)
physics.addBody(pik,"dynamic",{density = 0.6,friction=0.1, bounce=0.4, radius=30})
game:insert(pik)

local wall= display.newImage("wall2.png",-300,-200)
physics.addBody(wall,"static",{density = 1.5,friction=4, bounce=0.2})--inSensor=false
game:insert(wall)

local wall2= display.newImage("wall2.png",1250,-200)
physics.addBody(wall2,"static",{density = 1.5,friction=4, bounce=0.2})--inSensor=false
game:insert(wall2)

local roof= display.newImage("floor.png",-300,-200)
physics.addBody(roof,"static",{density = 1.5,friction=4, bounce=0.2})--inSensor=false
game:insert(roof)


local floor= display.newImage("floor.png",-300,300)
physics.addBody(floor,"static",{density = 1.5,friction=4, bounce=0.2})--inSensor=false
game:insert(floor)

for i=0,5 do
	for j=1,i do
		local box = display.newImage("crate.png")		
		box.x =200 + i*30-(j*18)
		box.y = 300-j*60
		physics.addBody(box,"dynamic",{density = 0.1, friction=0.3, bounce=0.2})
		game:insert(box)
	end
end

function circleTouched(event)
	if event.phase == "begun" then 
		display.getCurrentStage():setfocus(pik)
	elseif event.phase == "ended" then
		pik:applyLinearImpulse(event.xStart - event.x ,event.yStart - event.y, pik.x, pik.y )
		display.getCurrentStage():setFocus(nil)
	end
end
pik:addEventListener("touch",circleTouched)

function loop(e)
	 local targetx = 30 - pik.x 
	 game.x = game.x +(targetx -  game.x)*0.1
end
Runtime:addEventListener("enterFrame",loop)