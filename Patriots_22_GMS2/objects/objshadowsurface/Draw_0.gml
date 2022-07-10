if (surface_exists(surf_shadow))
{
surface_set_target(surf_shadow);
    with objSolidWall
    {
        draw_sprite_ext(sprite_index, image_index, x+2, y+2, image_xscale, image_yscale, image_angle, c_black, 1)
    }
    with objSolidWindow
    {
        draw_sprite_ext(sprite_index, image_index, x+2, y+2, image_xscale, image_yscale, image_angle, c_black, 1)
    }
    with objRailing
    {
        draw_sprite_ext(sprite_index, image_index, x+2, y+2, image_xscale, image_yscale, image_angle, c_black, 1)
    }
surface_reset_target();
draw_surface_ext(surf_shadow, x, y, image_xscale, image_xscale, image_angle, c_black, 0.5);

} else {
surf_shadow = surface_create(room_width, room_height);
}