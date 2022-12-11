//fade-in (default)
fadeAlpha = 1;
alarm[0] = 1;

//super basic weapon sprite switch
with objWeapon
{
	if room = rmVilla1 {spriteMod = 1;}
	else spriteMod = 0;
}