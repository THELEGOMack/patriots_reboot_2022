var drawx=x,drawy=y,width=sprite_get_width(sprite_index),height=sprite_get_height(sprite_index)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if image_xscale!=1 {
    repeat floor(image_xscale) {
        draw_sprite_ext(sprite_index,image_index,drawx,drawy,1,1,image_angle,c_white,image_alpha)
        drawx+=width
    }
} else if image_yscale!=1 {
    repeat floor(image_yscale) {
        draw_sprite_ext(sprite_index,image_index,drawx,drawy,1,1,image_angle,c_white,image_alpha)
        drawy+=height
    }
} else {
    draw_self()
}