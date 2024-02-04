if ammo != 0
    {
	scrDrawPickup();
    } else {
    draw_sprite_ext(sprite_index, 1, x, y,image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    }
	
draw_set_font(fntPlaceholder);
var text_1 = "ammo: " + string(ammo);
draw_text_transformed_color(x+10, y-4, text_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)