SaveState = function(buf)
{
	buffer_write(buf, buffer_bool, canLook);
	buffer_write(buf, buffer_bool, canMove);
	buffer_write(buf, buffer_bool, canShoot);
	buffer_write(buf, buffer_string, mask);
	buffer_write(buf, buffer_u8, state);
	buffer_write(buf, buffer_string, weapon);
	buffer_write(buf, buffer_u8, ammoPlayer);
	buffer_write(buf, buffer_string, sprite_index);
	buffer_write(buf, buffer_u8, hp);
	buffer_write(buf, buffer_u16, shotsFired);
	buffer_write(buf, buffer_u16, shotsHit);
	buffer_write(buf, buffer_u8, bulletCount);
	//etc
}

LoadState = function(buf)
{
	canLook = buffer_read(buf, buffer_bool);
	canMove = buffer_read(buf, buffer_bool);
	canShoot = buffer_read(buf, buffer_bool);
	mask = buffer_read(buf, buffer_string);
	state = buffer_read(buf, buffer_u8);
	weapon = buffer_read(buf, buffer_string);
	ammoPlayer = buffer_read(buf, buffer_u8);
	sprite_index = buffer_read(buf, buffer_string);
	hp = buffer_read(buf, buffer_u8);
	shotsFired = buffer_read(buf, buffer_u16);
	shotsHit = buffer_read(buf, buffer_u16);
	bulletCount = buffer_read(buf, buffer_u8);
	//etc
}

persistent = true;

motion={                                // motion vector2
    x:0,
    y:0
}
axis={                                    // input vector2
    x:0,
    y:0
}
axis_interp={                            // interpolated axis between the input
    x:0,
    y:0    
}
spd_interp=0                            // speed interpolated 
move_axis=0                                //movement direction in angles
col_radius = 12

//initialize variables
accel = 0.4;
shootAnimSpeed = 0; //attacking animation speed
state = 0;
deathCount = 0;
lastX = 0;
lastY = 0;
bulletCount = 0;
teleported = false;
//control
keyLeft = 0;
keyRight = 0;
keyUp = 0;
keyDown = 0;

canLook = global.canLook;
canShoot = global.canShoot;
canMove = global.canMove;

//mask drawing
mask = noone;
maskPosMod = 0;
maskIndexMod = 0;
spriteCenter = 0;

//weapon variables
weapon = "unarmed";
ammoPlayer = 0;
shootTimer = 0; //attack "cooldown"
pWeaponDrop = noone;
//put default values in here?

//accuracy variables
shotsFired = 0;
shotsHit = 0;

event_inherited();

image_speed = 0;