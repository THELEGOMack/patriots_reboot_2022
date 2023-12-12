scrDropShadowCast(sprMustangMaskWhole, image_index, image_angle);
draw_self();
draw_sprite_ext(sprMustangDoorL, 0, _xPosL, _yPosL, image_xscale, image_yscale, image_angle + doorRotL, c_white, 1);
draw_sprite_ext(sprMustangDoorR, 0, _xPosR, _yPosR, image_xscale, image_yscale, image_angle + doorRotR, c_white, 1);

draw_text_color(x, y, string(state), c_lime, c_lime, c_lime, c_lime, 1)