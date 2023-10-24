/// Initialise light

// NOTES: This is an example point light. Lights are INSTANCE based, therefore 
// it is one light per-instance, and multiple lights cannot be assigned to a single 
// instance. This may not be the most performance efficient way to do things, but this 
// engine was designed for a compromise of performance with ease of use.
//
// The light will use the assigned sprite_index for drawing and for the best effect 
// the sprite should be white or grey-scale. You can colour the light and set it's
// alpha value using the variables assigned in the function below.
//
// The light instances should NOT be visible, and in this demo project the 
// visible flag is set to false in the object properties.
// 
// All light instances MUST BE CHILDREN OF obj_Aura_Light_Parent, otherwise they 
// will not be drawn.


// Set up light

// First assign the sprite. You can assign the sprite in the object editor if 
// you wish, but I do it here to make editing the room easier.

sprite_index = spr_Aura_Point_Light;

// Now initialise the light (see the cript for the arguments)
if room == rm_Aura_Demo var static_light = true else var static_light = false;
aura_light_init(128, make_color_rgb(random(256), random(256), random(256)), 0.8 + random(0.2), static_light);
// DEMO ONLY

// Even if a light is static, you can still change it's alpha and colour,
// so we have a variable to control this in the demo.
flash = false;

