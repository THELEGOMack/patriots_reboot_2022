draw_sprite_ext(arrow, subImg, x, y, 1, 1, 0, c_white, image_alpha);

if arrow = sprGoArrow
{
	switch(arrowDir)
	{
		case "up":
		subImg = 1;
		break;
	
		case "down":
		subImg = 3;
		break;
	
		case "left":
		subImg = 2;
		break;
	
		case "right":
		subImg = 0;
		break;
	}
}