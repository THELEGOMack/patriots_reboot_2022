gpu_set_blendmode(bm_subtract);
switch (dir) {
    case 0: draw_rectangle_color(x, y, x + image_xscale, y + image_yscale, c_black, merge_color(c_black, c_white, gAlpha), merge_color(c_black, c_white, gAlpha), c_black, 0); break;
    case 90: draw_rectangle_color(x, y, x + image_xscale, y + image_yscale, merge_color(c_black, c_white, gAlpha), merge_color(c_black, c_white, gAlpha), c_black, c_black, 0); break;
    case 180: draw_rectangle_color(x, y, x + image_xscale, y + image_yscale, merge_color(c_black, c_white, gAlpha), c_black, c_black, merge_color(c_black, c_white, gAlpha), 0); break;
    case 270: draw_rectangle_color(x, y, x + image_xscale, y + image_yscale, c_black, c_black, merge_color(c_black, c_white, gAlpha), merge_color(c_black, c_white, gAlpha), 0); break;
}
gpu_set_blendmode(bm_normal);