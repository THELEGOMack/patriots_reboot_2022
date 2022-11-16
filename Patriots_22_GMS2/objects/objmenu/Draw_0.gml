//draw menu options
draw_set_font(fntMenu);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//for loop
for (var i = 0; i < opLength; i++)
	{
	var _c = c_white;
	if pos == i {_c = c_fuchsia}
	draw_text_color(objCampaignTitle.x+opBorder, objCampaignTitle.y+opBorder + opSpace*i, option[menuArrayLevel, i], _c, _c, _c, _c, 1);
	}