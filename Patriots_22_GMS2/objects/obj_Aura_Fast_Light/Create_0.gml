// This is a FAST light object. This uses no surfaces and is simply the 
// instance sprite drawn at the appropriate moment to the main Aura
// surface. As Such, you can set most of the properties as you would for 
// a regular instance sprite.

// Note that the object itself has the "visible" flag set to false, and 
// is a child of the obj_Aura_Light_Parent_Fast.

Aura_Light_Init_Fast(0.1 + random(0.5), 0.1 + random(0.5), 0, make_colour_hsv(random(255), 255, 255), 1);

speed = 2 + random(5);
direction = random(360);
image_angle = random(360);
image_alpha = 0.5 + random(0.5);


