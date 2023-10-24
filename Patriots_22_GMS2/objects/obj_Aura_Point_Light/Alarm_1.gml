/// Flash Alarm

// DEMO ONLY

// Change the light colour. This works no matter whether the light is 
// static or dynamic.

var c = colour_get_hue(aura_light_colour);
c++;
if c > 255 c -= 255;
aura_light_colour = make_colour_hsv(c, 255, 255);
alarm[1] = 1;

