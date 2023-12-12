var _floor = instance_create_layer(x, y, "furnitureFloor", objElevatorFloor);
_floor.image_angle = image_angle;
_floor.image_xscale = image_xscale;
_floor.image_index = floorSprite;
scrDropShadowCast(sprite_index, image_index, image_angle);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

//draw gradient shading

var arrowPosX;
var arrowPosY;
var _w = 52;
var _h = 43;
if _direction = 0 {arrowPosX = -_h; arrowPosY = _w;}
if _direction = 90 {arrowPosX = _w; arrowPosY = _h;}
if _direction = 180 {arrowPosX = _h; arrowPosY = _w;}
if _direction = 270 {arrowPosX = _w; arrowPosY = -_h;}

//draw arrow
if doneOpen = true
{draw_sprite_ext(sprArrow, imgSpd, x + arrowPosX, y + arrowPosY + bobAmt, 1, 1, dir, c_white, 1);}
else {draw_sprite_ext(sprArrow, 0, x + arrowPosX, y + arrowPosY, 1, 1, dir, c_white, 0.25);}