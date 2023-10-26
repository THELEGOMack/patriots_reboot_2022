draw_sprite_ext(sprPixel, 0, 0, 0, display_get_width(), display_get_height(), 0, c_black, bgFade);

draw_set_font(fntLCD);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext_color(_drawX, _drawY - lineSep*2, string("88:88 88"), 0, 3840, timeCol2, timeCol2, timeCol2, timeCol2, bgFade);
draw_text_ext_color(_drawX, _drawY - lineSep*2, string("{0}:{1} {2}", _hr, _min, _am_pm), 0, 3840, timeCol1, timeCol1, timeCol1, timeCol1, textFade);

draw_set_font(fntTitleCard);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext_color(_drawX, _drawY + lineSep, string("- {0} {1}{2}, {3} -", _mo, _day, _suf, _yr), 0, 3840, c_white, c_white, c_white, c_white, textFade);

draw_set_font(fntTitleCard);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext_color(_drawX, _drawY + lineSep*2, string("- {0}, {1} -", _city, _state), 0, 3840, c_white, c_white, c_white, c_white, textFade);