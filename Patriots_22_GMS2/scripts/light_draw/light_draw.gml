/// @description light_draw(lighting_system, x, y, additive, shadows, blur_amount)
/// @param lighting_system The lighting system to draw.
/// @param x The x location to draw the shadow map.
/// @param y The y location to draw the shadow map.
/// @param additive Whether or not to use additive blending.
/// @param shadows Whether or not to draw shadows.
/// @param blur_amount How blurry to make the shadows, numbers from 0 to 1 are good but you can go higher for more blurriness.
function light_draw(argument0, argument1, argument2, argument3, argument4, argument5) {
	/*
	Draws the lights and shadows.
	Blurry shadows generally makes a lower quality lightmap look nicer without the extra memory required for a full quality lightmap.
	Important note: The object calling this function should have a lower depth than the casters.
	*/

	var lighting_system, x_pos, y_pos, additive, shadows, blur_amount, width, height, size, ambient_color, quality, max_time, time, light_surface, light_map, half_size;

	lighting_system = argument0;
	x_pos = argument1;
	y_pos = argument2;
	additive = argument3;
	shadows = argument4;
	blur_amount = argument5;

	width = ds_list_find_value(lighting_system, 0);
	height = ds_list_find_value(lighting_system, 1);
	size = ds_list_find_value(lighting_system, 2);
	ambient_color = ds_list_find_value(lighting_system, 3);
	quality = ds_list_find_value(lighting_system, 4);
	max_time = ds_list_find_value(lighting_system, 5);
	time = ds_list_find_value(lighting_system, 6);
	light_surface = ds_list_find_value(lighting_system, 7);
	light_map = ds_list_find_value(lighting_system, 8);

	half_size = size / 2;

	/*
	 * Increment the iterations clock.
	 */
	time += delta_time;
	ds_list_set(lighting_system, 6, time);

	/*
	 * Only draw if the iteration time has been met.
	 */
	if (time >= max_time)
	{
	    /*
	     * Reset the clock.
	     */
	    time = 0;
	    ds_list_set(lighting_system, 6, time);

	    /*
	     * Make sure the light map surface exists and clear it.
	     */
	    if (!surface_exists(light_map))
	    {
	        light_map = surface_create(width * quality, height * quality);
	        ds_list_set(lighting_system, 8, light_map);
	    }
	    surface_set_target(light_map);
	    draw_clear(c_white);
	    gpu_set_blendmode(bm_normal);
	    draw_clear(ambient_color);
	    surface_reset_target();
    
	    /*
	     * Recreate the light surface if it doesn't exist.
	     */
	     if (!surface_exists(light_surface))
	    {
	        light_surface = surface_create(size * quality, size * quality);
	        ds_list_set(lighting_system, 7, light_surface);
	    }
    
	    /*
	     * Draw lights.
	     */
	    var lights, casters, deleted_lights, deleted_casters;
	    lights = ds_list_find_value(lighting_system, 9);
	    casters = ds_list_find_value(lighting_system, 10);
    
	    /*
	     * Since we can't remove elements while iterating, we keep track of deleted lights and casters with these lists.
	     */
	    deleted_lights = ds_list_create();
	    deleted_casters = ds_list_create();
    
	    for (var i = 0; i < ds_list_size(lights); i++)
	    {
	        var light, sprite, scale, color, alpha, angle, left, top, right, bottom, light_shadows, max_distance, light_x_pos, light_y_pos, light_enable, inside;
	        light = ds_list_find_value(lights, i);
        
	        /*
	         * If the light was deleted, mark it and move on.
	         */
	        if (!ds_exists(light, ds_type_list))
	        {
	            ds_list_add(deleted_lights, i);
	            continue;
	        }
       
	        sprite = ds_list_find_value(light, 0);
	        scale = ds_list_find_value(light, 1);
	        color = ds_list_find_value(light, 2);
	        alpha = ds_list_find_value(light, 3);
	        angle = ds_list_find_value(light, 4);
	        light_shadows = ds_list_find_value(light, 5);
	        max_distance = ds_list_find_value(light, 6);
	        light_x_pos = ds_list_find_value(light, 7);
	        light_y_pos = ds_list_find_value(light, 8);
	        light_enable = ds_list_find_value(light, 9);
        
	        /*
	         * Skip this light if it is disabled.
	         */
	         if (!light_enable)
	         {
	             continue;
	         }

	        if (sprite_get_xoffset(sprite) != sprite_get_width(sprite) / 2 && sprite_get_yoffset(sprite) != sprite_get_height(sprite) / 2)
	        {
	            left = light_x_pos - size / 2;
	            top = light_y_pos - size / 2;
	            right = left + size;
	            bottom = top + size;
	        }
	        else 
	        {
	            left = light_x_pos - max_distance / 2;
	            top = light_y_pos - max_distance / 2;
	            right = left + max_distance;
	            bottom = top + max_distance;
	        }

	        /*
	         * Check if the light is inside the light map before drawing.
	         */
	        inside = rectangle_in_rectangle(left, top, right, bottom, x_pos, y_pos, x_pos + width, y_pos + height) > 0;
	        if (inside)
	        {
	            /*
	             * Just draw the sprite if shadows are turned off.
	             */
	            if (!shadows || !light_shadows)
	            {
	                surface_set_target(light_map);
	                gpu_set_blendmode(bm_add);
	                draw_sprite_ext(sprite, 0, (light_x_pos - x_pos) * quality, (light_y_pos - y_pos) * quality, scale * quality, scale * quality, angle, color, alpha);
	                gpu_set_blendmode(bm_normal)
	                surface_reset_target()
	            }
	            else
	            {
	                /*
	                 * Clear the light surface.
	                 */
	                surface_set_target(light_surface)
	                draw_clear(c_black)
	                draw_sprite_ext(sprite, 0, half_size * quality, half_size * quality, scale * quality,scale * quality, angle, color, alpha);
                
	                /*
	                 * Draw shadows.
	                 */
	                if (shadows && light_shadows)
	                {
	                    for (var j = 0; j < ds_list_size(casters); j++)
	                    {
	                        var caster, points_x, points_y, caster_left, caster_top, caster_right, caster_bottom, caster_x_pos, caster_y_pos, caster_enable;
	                        caster = ds_list_find_value(casters, j);
        
	                        /*
	                         * If the caster was deleted, mark it and move on.
	                         */
	                        if (!ds_exists(caster, ds_type_list))
	                        {
	                            ds_list_add(deleted_casters, j);
	                            continue;
	                        }
                        
	                        points_x = ds_list_find_value(caster, 0);
	                        points_y = ds_list_find_value(caster, 1);
	                        caster_left = ds_list_find_value(caster, 2);
	                        caster_top = ds_list_find_value(caster, 3);
	                        caster_right = ds_list_find_value(caster, 4);
	                        caster_bottom = ds_list_find_value(caster, 5);
	                        caster_x_pos = ds_list_find_value(caster, 6);
	                        caster_y_pos = ds_list_find_value(caster, 7);
	                        caster_enable = ds_list_find_value(caster, 8);
                        
	                        /*
	                         * Skip this caster if it is disabled.
	                         */
	                         if (!caster_enable)
	                         {
	                             continue;
	                         }

	                        /*
	                         * The caster points are all relative, so we have to add the position to them.
	                         */
	                        if (rectangle_in_rectangle(caster_x_pos + caster_left, caster_y_pos + caster_top, caster_x_pos + caster_right, caster_y_pos + caster_bottom, left, top, right, bottom))
	                        {
	                            draw_primitive_begin(pr_trianglestrip);
	                            /*
	                             * Draw all the cast points.
	                             */
	                            var points_cast_x, points_cast_y;
	                            for(var k = 0; k < ds_list_size(points_x); k++)
	                            {
	                                var dir, x_start, y_start;
	                                x_start = caster_x_pos + ds_list_find_value(points_x, k);
	                                y_start = caster_y_pos + ds_list_find_value(points_y, k);
	                                dir = point_direction(light_x_pos, light_y_pos, x_start, y_start);
	                                points_cast_x[k] = x_start + lengthdir_x(max_distance, dir);
	                                points_cast_y[k] = y_start + lengthdir_y(max_distance, dir);
                                        
	                                draw_vertex_colour((x_start - (light_x_pos - half_size)) * quality, (y_start - (light_y_pos - half_size)) * quality, c_black, 1);
	                                draw_vertex_colour((points_cast_x[k] - (light_x_pos - half_size)) * quality, (points_cast_y[k] - (light_y_pos - half_size)) * quality, c_black, 1);
	                            }
	                            var x_start, y_start;
	                            x_start = caster_x_pos + ds_list_find_value(points_x, 0);
	                            y_start = caster_y_pos + ds_list_find_value(points_y, 0);
	                            draw_vertex_colour((x_start - (light_x_pos - half_size)) * quality, (y_start - (light_y_pos - half_size)) * quality, c_black, 1);
	                            draw_vertex_colour((points_cast_x[0] - (light_x_pos - half_size)) * quality, (points_cast_y[0] - (light_y_pos - half_size)) * quality, c_black, 1);

	                            /*
	                             * Draw the outline of the shadow.
	                             * If you don't plan on your lights going "behind" the casters, commenting this loop out is a small optimiztation.
	                             */
	                            for(var k = 0; k < ds_list_size(points_x); k++)
	                            {
	                                draw_vertex_colour((points_cast_x[k] - (light_x_pos - half_size)) * quality, (points_cast_y[k] - (light_y_pos - half_size)) * quality, c_black, 1);
	                                draw_vertex_colour((points_cast_x[0] - (light_x_pos - half_size)) * quality, (points_cast_y[0] - (light_y_pos - half_size)) * quality, c_black, 1);
	                            }
	                            draw_primitive_end();
	                        }
	                    }
	                }
	                surface_reset_target();

	                surface_set_target(light_map);
	                draw_set_alpha(1);
	                draw_set_color(c_white);
	                gpu_set_blendmode(bm_add);
	                if (surface_exists(light_surface))
	                {
	                    draw_surface(light_surface, (light_x_pos - half_size - x_pos) * quality, (light_y_pos - half_size - y_pos) * quality);
	                }
	                gpu_set_blendmode(bm_normal);
	                surface_reset_target();
	            }
	        }
	    }

	    /*
	     * Remove the lights and casters that were marked for deletion.
	     * Don't forget to destroy the lists to free up memory.
	     */
	     for (var i = 0; i < ds_list_size(deleted_lights); i++)
	     {
	         var index;
	         index = ds_list_find_value(deleted_lights, i);
	         ds_list_delete(lights, index);
	     }
	     ds_list_destroy(deleted_lights);
     
	     for (var i = 0; i < ds_list_size(deleted_casters); i++)
	     {
	         var index;
	         index = ds_list_find_value(deleted_casters, i);
	         ds_list_delete(casters, index);
	     }
	     ds_list_destroy(deleted_casters);
	}

	var mask, mask_surface;
	mask = ds_list_find_value(lighting_system, 11);
	mask_surface = ds_list_find_value(lighting_system, 12);

	/*
	 * If we have a mask to draw, set the mask surface as the drawing surface,
	 * draw the application surface as the background,
	 * draw the light map on top of it, and then subtract the mask.
	 * Finally draw the mask surface to the default target.
	 */
	if (sprite_exists(mask))
	{
	    if (!surface_exists(mask_surface))
	    {
	        mask_surface = surface_create(size * quality, size * quality);
	        ds_list_set(lighting_system, 12, mask_surface);
	    }
	    surface_set_target(mask_surface);
	    draw_surface_stretched(application_surface, (camera_get_view_x(view_camera[view_current]) - x_pos) * quality, (camera_get_view_y(view_camera[view_current]) - y_pos) * quality, camera_get_view_width(view_camera[view_current]) * quality, camera_get_view_height(view_camera[view_current]) * quality);
	    if (!additive)
	    {
	        gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	    }
	    else
	    {
	        gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
	    }
	    if (blur_amount <= 0)
	    {
	        draw_surface(light_map, 0, 0);
	    }
	    else
	    {
	        draw_surface_blurred(light_map, 0, 0, 1, 1, blur_amount);
	    }
	    gpu_set_blendmode(bm_subtract);
	    draw_sprite_ext(mask, 0, 0, 0, quality, quality, 0, c_white, 1);
	    gpu_set_blendmode(bm_normal);
	    surface_reset_target();

	    draw_surface_ext(mask_surface, x_pos, y_pos, 1 / quality, 1 / quality, 0, c_white, 1);
	}
	else
	{
	    if (!additive)
	    {
	        gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	    }
	    else
	    {
	        gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
	    }

	    if (blur_amount <= 0)
	    {
	        draw_surface_ext(light_map, x_pos, y_pos, 1 / quality, 1 / quality, 0, c_white, 1);
	    }
	    else
	    {
	        draw_surface_blurred(light_map, x_pos, y_pos, 1 / quality, 1 / quality, blur_amount);
	    }
	    gpu_set_blendmode(bm_normal);
	}



}
