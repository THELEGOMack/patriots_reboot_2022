if (broken = 0)
{
	draw_sprite_ext(sprSamVendingMachine, 0, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, 0.5);
	draw_sprite_ext(sprSamVendingMachine, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
else if (broken = 1)
{
	draw_sprite_ext(sprSamVendingMachineShards, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprSamVendingMachine, 1, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, 0.5);
	draw_sprite_ext(sprSamVendingMachine, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}