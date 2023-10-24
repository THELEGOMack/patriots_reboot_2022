if (surface_exists(objBloodSurface.surface))
{
	surface_set_target(objBloodSurface.surface)
	draw_sprite_ext(sprite_index, image_index, x*objBloodSurface.resMod, y*objBloodSurface.resMod, image_xscale*objBloodSurface.resMod, image_yscale*objBloodSurface.resMod, image_angle, global.bloodColor, image_alpha);
	surface_reset_target();
}

if (!surface_exists(objBloodSurface.surface))
{
	objBloodSurface.surface = surface_create(room_width, room_height);
}