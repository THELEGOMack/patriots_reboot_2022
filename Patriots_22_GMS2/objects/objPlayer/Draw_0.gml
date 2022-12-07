event_inherited();

if (keyUp or keyDown or keyRight or keyLeft) and (canMove = true)
    {
    draw_sprite_ext(playerLegs, legIndex, x+1, y+1, abs(image_xscale), abs(image_yscale), legAngle, c_black, 0.5);
    draw_sprite_ext(playerLegs, legIndex, x, y, abs(image_xscale), abs(image_yscale), legAngle, c_white, image_alpha);
    }
draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, lookDir, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, lookDir, c_white, image_alpha);

if global.debug = true{
	draw_set_font(fntPlaceholder);
	var text_1 = "Ammo: " + string(ammoPlayer);
    var text_2 = "Weapon: " + string(weapon);
    var text_3 = "HP: " + string(hp);
	var text_4 = "Shoot Timer: " + string(shootTimer);
	var text_5 = "shootAnimSpeed: " + string(shootAnimSpeed);
    draw_text_transformed_color(x+10, y-4, text_1, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
    draw_text_transformed_color(x+10, y-8, text_2, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
    draw_text_transformed_color(x+10, y-12, text_3, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
    draw_text_transformed_color(x+10, y-16, text_4, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
	draw_text_transformed_color(x+10, y-20, text_5, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)}