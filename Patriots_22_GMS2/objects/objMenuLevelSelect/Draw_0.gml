//draw backing?
draw_sprite_ext(sprite_index, image_index, XCenter, YCenter, image_xscale*4, image_yscale*4, image_angle, c_white, image_alpha);
//draw text(s)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntInstruction);
draw_text_transformed_color(XCenter, YCenter+lineSpacing, txtLevelTitle, 1, 1, image_angle, c_black, c_black, c_black, c_black, image_alpha);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntInstruction);
draw_text_transformed_color(XCenter, YCenter+(lineSpacing/2), txtHeading, 1, 1, image_angle, c_black, c_black, c_black, c_black, image_alpha);