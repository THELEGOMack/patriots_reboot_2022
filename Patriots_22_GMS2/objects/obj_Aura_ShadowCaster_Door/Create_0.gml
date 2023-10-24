// this instance is an example of how to make an object change 
// static lights to dynamic while it moves and then go back to 
// static afterwards.

// First define the shadow mesh

aura_shadowcaster_box_init();

// Call an alarm to check for a collision with the "player" (the torch in this demo).
alarm[0] = room_speed;

