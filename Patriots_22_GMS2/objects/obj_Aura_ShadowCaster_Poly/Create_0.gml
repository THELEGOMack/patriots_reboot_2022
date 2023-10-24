// Create shadow casting polygon instance.

// First call the Init function...

aura_shadowcaster_poly_init();

// Now add all the points of the polygon....

aura_shadowcaster_add_point(0, -(sprite_height / 2));
aura_shadowcaster_add_point(sprite_width / 2, sprite_height / 2);
aura_shadowcaster_add_point(0, 0);
aura_shadowcaster_add_point(-(sprite_width / 2), sprite_height / 2);
aura_shadowcaster_add_point(0, -(sprite_height / 2));

// Note that polygons can be concave OR convex! And that 
// all points should be defined in a CLOCKWISE direction.

// The following is for the DEMO and can be removed

direction = choose(0, 90, 180, 270);
speed = 1 + irandom(3);
alarm[0] = room_speed;

