if (surface_exists(objBodySurface.surface))
{
	surface_set_target(objBodySurface.surface)
	draw_sprite_ext(sprite_index, image_index, x*objBodySurface.resMod, y*objBodySurface.resMod, image_xscale*objBodySurface.resMod, image_yscale*objBodySurface.resMod, image_angle, c_white, image_alpha);
	surface_reset_target();
}

if (!surface_exists(objBodySurface.surface))
{
	objBodySurface.surface = surface_create(room_width, room_height);
}

scrCheckFloorClear();