var _smoke = instance_create_depth(x + lengthdir_x(7, image_angle), y + lengthdir_y(7, image_angle), depth, objSmokePuff);
_smoke.image_angle = image_angle - 4 + random(8);
_smoke.direction = image_angle;
_smoke.image_alpha = 0.4;
_smoke.speed = random_range(0.1, 0.4);

image_speed = 0;
alarm[0] = 100 + random(200);