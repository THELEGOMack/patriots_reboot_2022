// This alarm detects the player (torch) and moves the instance if detected
// to create a door effect. Since the lights in the DEMO room are static, 
// we need to manually call the update variable so that they briefly become 
// dynamic and so change the shadows.

if collision_point(x + (sprite_width / 2), y + (sprite_height / 2), obj_Aura_Torch_Light, false, false)
{
alarm[0] = 1;
with (obj_Aura_Light_Parent)
    {
    // Check the instance is actually within the light source
    if place_meeting(x, y, other)
        {
        // It is so update!
        aura_light_renew = true;
        }
    }
// Move the instance based on whther it is vertical or horizontal
if image_xscale > image_yscale
    {
    if x > xstart - sprite_width
        {
        x -= 5;
        }
    else
        {
        alarm[1] = 1;
        }
    }
else
    {
    if y > ystart - sprite_height
        {
        y -= 5;
        }
    else
        {
        alarm[1] = 1;
        }
    }
}
else alarm[1] = room_speed;

