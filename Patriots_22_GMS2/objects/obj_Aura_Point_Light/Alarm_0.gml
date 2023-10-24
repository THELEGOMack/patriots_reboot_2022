/// Flash Alarm

// Change thelight alpha. This works no matter whether the light is 
// static or dynamic.

// DEMO ONLY

if aura_light_alpha < 1
{
aura_light_alpha += 0.05;
}
else
{
aura_light_alpha = 0.2;
}
alarm[0] = 1;

