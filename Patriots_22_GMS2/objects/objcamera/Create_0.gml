view_width = 1920/4;
view_height = 1080/4;

window_scale = 4;

window_set_size(view_width*window_scale, view_height*window_scale);
window_center();

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);

follow = objPlayerViewCenter;
smooth = 0.1; //1 = instant snap