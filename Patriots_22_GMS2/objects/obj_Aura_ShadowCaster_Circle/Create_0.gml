// Create shadow casting circular instance

// The function creates a polygon mesh for the shadows, where the "precision"
// value is the number of sides of the polygon.

aura_shadowcaster_circle_init(30, sprite_width / 2);

// DEMO code below can be removed

direction = choose(0, 90, 180, 270);
speed = 1 + irandom(3);
alarm[0] = room_speed;

