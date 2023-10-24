if ( window_get_width() != window_width || window_get_height() != window_height )
&& surface_exists( application_surface )
{
	window_width = window_get_width();
	window_height = window_get_height();
	
	var parent_width = window_width;
	var parent_height = window_height;
	
	var width = parent_width;
	var height = parent_height;
	
	var cam = view_camera[0];
	var cam_w = camera_get_view_width( cam );
	var cam_h = camera_get_view_height( cam );
	var aspect = ( cam_w / cam_h );
	
	if !( width < 1 || height < 1 )
	{
		var parent_aspect = parent_width / parent_height;
		var _x = ( width / 2 );
		var _y = ( height / 2 );
		var x1 = 0;
		var y1 = 0;
		var x2 = parent_width;
		var y2 = parent_height;
		if ( aspect >= parent_aspect )
		{
			height = ( width / aspect );
			y1 = ~~( _y - ( height / 2 ) );
			y2 = parent_height - y1;
		}
		else
		{
			width = ( height * aspect );
			x1 = ~~( _x - ( width / 2 ) );
			x2 = parent_width - x1;
		}
		app_pos[0] = x1;
		app_pos[1] = x2;
		app_pos[2] = y1;
		app_pos[3] = y2;
		surface_resize( application_surface, width, height );
	}
}