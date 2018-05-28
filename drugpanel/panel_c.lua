tiempo = 60
click = 0
local screenWidth, screenHeight = guiGetScreenSize ( ) -- Get the screen resolution (width and height)
local screenW, screenH = guiGetScreenSize()
ventanadrogas = guiCreateWindow((screenW - 469) / 2, (screenH - 222) / 2, 469, 222, "Panel drogas v1", false)
guiWindowSetSizable(ventanadrogas, false)
guiSetAlpha(ventanadrogas, 0.68)

usarmaria = guiCreateButton(375, 81, 80, 34, "Usar", false, ventanadrogas)
usarcoca = guiCreateButton(375, 125, 80, 34, "Usar", false, ventanadrogas)
usarcrack = guiCreateButton(375, 169, 80, 34, "Usar", false, ventanadrogas)
usarmeta = guiCreateButton(375, 37, 80, 34, "Usar", false, ventanadrogas)
textometa = guiCreateLabel(64, 41, 301, 24, "Metanfetamina: mayor velocidad ", false, ventanadrogas)
textomaria = guiCreateLabel(64, 81, 301, 24, "Marihuana: realentiza el tiempo y mayor salto", false, ventanadrogas)
textococa = guiCreateLabel(64, 125, 301, 24, "Cocahina: aumento de vida", false, ventanadrogas)
textocrack = guiCreateLabel(64, 169, 301, 24, "Crack: mayor resistencia al daño", false, ventanadrogas)
guiSetVisible(ventanadrogas,false)

function muestrapanel()
	if(guiGetVisible( ventanadrogas) == false) then
		guiSetVisible(ventanadrogas,true)
		showCursor(true)
	else
		guiSetVisible(ventanadrogas,false)
		showCursor(false)
	end
end

bindKey("F4", "down", muestrapanel)




function texto()
dxDrawText( "Tiempo metanfetamina: "..tostring(tiempo), 400,500 )

end

  function contador()
tiempo = tiempo - 1
if tiempo == 0 then
	tiempo = 60
end

end

function removeevent()

setGameSpeed( 1 )

removeEventHandler( "onClientRender", getRootElement(), texto )
	click = 0
	end



function usarmetanfetamina ( button )


    if button == "left"  then
		if click == 0 then
		setGameSpeed(1.3)
		     setTimer( contador, 1000,60 )
addEventHandler( "onClientRender", getRootElement(), texto )
		setTimer( removeevent, 60000, 1 )
click = click + 1
else
outputChatBox( "Tranquilo viejo, una droga a la vez" )
end

end
end


addEventHandler( "onClientGUIClick", usarmeta, usarmetanfetamina,false ) 

function resetmaria()
setGravity(0.008)

end

function usarmarihuana(button)
	if (button == "left") then
		setGravity(0.004)
			setTimer( resetmaria, 60000, 1 )

	end
end
addEventHandler( "onClientGUIClick", usarmaria, usarmarihuana,false )



function usarcocahina()
	triggerServerEvent( "darvida", root, getLocalPlayer())
	triggerServerEvent( "resetvida", root, getLocalPlayer())

end

addEventHandler( "onClientGUIClick", usarcoca, usarcocahina,false ) 




local reductionPercent = '50'

addEventHandler("onClientPlayerDamage",root,function(attacker,weapon,bodypart,loss)
    if loss then
      local health = getElementHealth(localplayer)
      setElementHealth(localplayer,health+(loss/reductionPercent))
    end
end)

function usarcrackeo()
triggerClientEvent( "onClientPlayerDamage", root)
end

addEventHandler( "onClientGUIClick", usarcrack, usarcrackeo,false )





