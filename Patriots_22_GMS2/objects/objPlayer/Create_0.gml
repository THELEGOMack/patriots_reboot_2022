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
walkSpeed = 0; //Max walking speed
accel = 0.4;
legAngle = 0;
playerLegs = sprPlayerLegs;
legIndex = 0;
attacking = 0;
shootAnimSpeed = 0;
hp = 2;
state = 0;
floorClear = 0;

//weapon variables
weapon = noone;
ammoPlayer = 0;
shootTimer = 0;
pWeaponDrop = noone;

image_speed = 0;
if !instance_exists(objCamera) {instance_create_layer(x, y, layer, objCamera);}
if !instance_exists (objPlayerViewCenter) {instance_create_layer(x, y, layer, objPlayerViewCenter);}

scrPlayerCharacter();