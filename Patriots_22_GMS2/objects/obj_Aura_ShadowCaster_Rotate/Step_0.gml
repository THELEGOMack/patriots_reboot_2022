// Rotate the sprite

image_angle++;

// Use the Rotate function
aura_shadowcaster_rotate(image_angle);

// You can manually rotate the shadow caster too...
//  By rotate the shadow mesh using the arrays we initialised in the create event
/*
var num = aura_shadow_points;

aura_shadowcaster_poly_init();
for (var i = 0; i < num; i++)
{
aura_shadowcaster_add_point(lengthdir_x(a_dist[i], a_dir[i] + image_angle), lengthdir_y(a_dist[i], a_dir[i] + image_angle));
}
*/

