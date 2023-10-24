// In this shadow caster, we are going to rotate the mesh along with the sprite
// This is easily done by first getting the lengths and dircetions to the 
// points that will make up the polygon mesh...

image_xscale = 1 + random(2);
image_yscale = 0.25 + random(0.75);

a_dist[0] = point_distance(0, 0, -(sprite_width / 2), -(sprite_height/ 2));
a_dist[1] = point_distance(0, 0, sprite_width / 2, -(sprite_height/ 2));
a_dist[2] = point_distance(0, 0, sprite_width / 2, sprite_height/ 2);
a_dist[3] = point_distance(0, 0, -(sprite_width / 2), sprite_height/ 2);

a_dir[0] = point_direction(0, 0, -(sprite_width / 2), -(sprite_height/ 2));
a_dir[1] = point_direction(0, 0, sprite_width / 2, -(sprite_height/ 2));
a_dir[2] = point_direction(0, 0, sprite_width / 2, sprite_height/ 2);
a_dir[3] = point_direction(0, 0, -(sprite_width / 2), sprite_height/ 2);

// We now initialise the mesh as we would any other...

aura_shadowcaster_poly_init();
for (var i = 0; i < 4; i++)
{
aura_shadowcaster_add_point(lengthdir_x(a_dist[i], a_dir[i] + image_angle), lengthdir_y(a_dist[i], a_dir[i] + image_angle));
}

// The Step Event will replicate this process...


