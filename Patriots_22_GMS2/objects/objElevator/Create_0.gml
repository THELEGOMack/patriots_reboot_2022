doneOpen = 0;
doneClose = 0;
state = startOpen;
imgSpd = 0;
bobAmt = 0;
_direction = 0;

image_speed = 0;
if startOpen = false {image_index = 0} else {image_index = 16}

if (image_angle = 0) and (image_xscale = 1) {x += 8; _direction = 0} //right
if (image_angle = 0) and (image_xscale = -1) {_direction = 180} //left
if (image_angle = 90) and (image_xscale = 1) {_direction = 90} //up
if (image_angle = 90) and (image_xscale = -1) {y += 8; _direction = 270} //down

if goingUp = true {dir = 90} else {dir = 270}