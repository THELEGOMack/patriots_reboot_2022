if (speed != 0)
    {
    draw_sprite_ext(NPCLegs, legIndex, x+1, y+1, image_xscale, image_yscale, legAngle, c_black, 0.5);
    draw_sprite_ext(NPCLegs, legIndex, x, y, image_xscale, image_yscale, legAngle, c_white, image_alpha);
    }
draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);