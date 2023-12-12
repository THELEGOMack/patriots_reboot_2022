if anim = noone {alarm[0] = 1}

global.canMove = canMove;
global.canShoot = canShoot;
global.canLook = canLook;

if anim != noone { //"cutscene" mode
	_dummy = instance_create_depth(x, y, depth, objNPC);
	_dummy.sprite_index = anim;
	_dummy.halo = true;
	_dummy.image_angle = image_angle;
	_dummy.image_index = 0;
	_dummy.image_speed = 0;
	_dummy.playerDummy = 1;
	
if instance_exists(objTitleCard) {tcWait = 180} else {tcWait = 0} //180 = length of title card visibility on screen
alarm[1] = tcWait + animWaitTime
}