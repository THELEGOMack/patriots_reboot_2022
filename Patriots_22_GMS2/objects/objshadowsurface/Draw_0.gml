if (surface_exists(surf_shadow))
{
surface_set_target(surf_shadow);
    with objSolidWall
    {
        draw_sprite_ext(sprite_index, image_index, x+(global.shadowDirX*2), y+(global.shadowDirY*2), image_xscale, image_yscale, image_angle, c_black, image_alpha)
    }
    with objSolidWindow
    {
        draw_sprite_ext(sprite_index, image_index, x+(global.shadowDirX*2), y+(global.shadowDirY*2), image_xscale, image_yscale, image_angle, c_black, image_alpha)
    }
    with objGlassPane
    {
        draw_sprite_ext(sprite_index, image_index, x+(global.shadowDirX*2), y+(global.shadowDirY*2), image_xscale, image_yscale, image_angle, c_black, image_alpha)
    }
    with objRailing
    {
        draw_sprite_ext(sprite_index, image_index, x+(global.shadowDirX*2), y+(global.shadowDirY*2), image_xscale, image_yscale, image_angle, c_black, image_alpha)
    }
surface_reset_target();
gpu_set_fog(true, global.shadowHue, 0, 1);
draw_surface_ext(surf_shadow, x, y, image_xscale, image_xscale, image_angle, c_white, global.shadowAlpha);
gpu_set_fog(false, c_white, 0, 0);

} else {
	
	//clear previous surface first
	
surf_shadow = surface_create(room_width, room_height);
}