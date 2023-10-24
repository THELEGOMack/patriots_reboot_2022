///@desc animation end
image_speed = 0;
image_index = -1;
instance_create_layer(x+lengthdir_x(24, image_angle+180), y+lengthdir_y(24, image_angle+180), "blood_layer", objBloodPool);
instance_destroy();