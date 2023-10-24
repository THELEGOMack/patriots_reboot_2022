// This alarm closes the door.

alarm[1] = 1;
if image_xscale > image_yscale
{
if x < xstart
    {
    x += 5;
    // Update the light again as the door closes
    with (obj_Aura_Light_Parent)
        {
        if place_meeting(x, y, other)
            {
            aura_light_renew = true;
            }
        }
    }
else
    {
    x = xstart;
    alarm[1] = -1;
    alarm[0] = 1;
    }
}
else
{
if y < ystart
    {
    y += 5;
    // Update the light again as the door closes
    with (obj_Aura_Light_Parent)
        {
        if place_meeting(x, y, other)
            {
            aura_light_renew = true;
            }
        }
    }
else
    {
    y = ystart;
    alarm[1] = -1;
    alarm[0] = 1;
    }
}

