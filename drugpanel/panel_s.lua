--variables globales
tiempo = 60
addEvent( "darvida", true ) 
    addEvent( "resetvida",true )
    function darVida1(thePlayer) 
setPedStat( thePlayer, 24, 1000 )  
 end 
function resetvida(thePlayer) 
setPedStat( thePlayer, 24, 500 )  
 end 
function darVida(thePlayer) 
setTimer( resetvida, 60000, 1,thePlayer)

 end 
 
 addEventHandler( "darvida", root,darVida1 )
addEventHandler("resetvida",root, darVida)
--serverside cocaine

