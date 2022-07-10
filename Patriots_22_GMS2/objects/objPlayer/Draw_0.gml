if (keyUp or keyDown or keyRight or keyLeft) and (canMove = true)
    {
    draw_sprite_ext(playerLegs, legIndex, x+1, y+1, image_xscale, image_yscale, legAngle, c_black, 0.5);
    draw_sprite_ext(playerLegs, legIndex, x, y, image_xscale, image_yscale, legAngle, c_white, image_alpha);
    }
draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, lookDir, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, lookDir, c_white, image_alpha);

if global.debug = true{
	var text_1 = "Ammo: " + string(ammoPlayer);
    var text_2 = "Weapon: " + string(weapon);
    var text_3 = "Walk Spd: " + string(walkSpeed);
	var text_4 = "Shoot Timer: " + string(shootTimer);
    draw_text_transformed_color(x+10, y-5, text_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
    draw_text_transformed_color(x+10, y-10, text_2, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
    draw_text_transformed_color(x+10, y-15, text_3, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
    draw_text_transformed_color(x+10, y-20, text_4, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)}