if (active = true)
{
	vis = 0;
	with objPlayer
	{
		//freeze player
		canMove = false;
		canShoot = false;
		canLook = false;
		teleported = false;
		
		//walk in direction of transition (not working)
		switch (objTransitionParent.walkDir) {
		    case 0: break; //right
		    case 90: break; //up
		    case 180: break; //left
		    case 270: break; //down
		    default: break;
		}
	}
	with objEffector
	{
		if fadeAlpha < 1 {
			alarm[0] = 1;
			}
	//get x and y coordinates relative to player
	}
	if objEffector.fadeAlpha = 1
	{
		//get instance ID of destination spawn point (if multiple)
		//check player walking direction
		//get relative cursor coordinates
		room_goto(targetRoom);
		objPlayer.x = targetX;
		objPlayer.y = targetY;
		objPlayer.teleported = true;
	}
	
//return to gameplay after teleport
alarm[0] = 1;
vis = 1;
arrowSprite = sprArrowGray; //broken?
with objPlayer{
	if teleported = true{
		canMove = global.canMove;
		canShoot = global.canShoot;
		canLook = global.canLook;
	}
}
	
} else exit