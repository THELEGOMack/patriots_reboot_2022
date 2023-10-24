if !surface_exists(surface) {
    surface = surface_create(room_width * resMod, room_height * resMod);
}
else {
    draw_surface_ext(surface, 0, 0, 1 / resMod, 1 / resMod, 0, c_white, 1);
}