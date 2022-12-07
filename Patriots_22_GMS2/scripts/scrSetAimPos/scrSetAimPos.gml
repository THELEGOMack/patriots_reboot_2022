function scrSetAimPos( xoff, yoff ) //thanks Sage
{
    var _x = window_get_width() / 2;
    var _y = window_get_height() / 2;
    var apos = application_get_position();
    var _xscale = ( apos[2] - apos[0] ) / camera_get_view_width( view_camera[0] );
    var _yscale = ( apos[3] - apos[1] ) / camera_get_view_height( view_camera[0] );
    _x += ( xoff * _xscale );
    _y += ( yoff * _yscale );
    window_mouse_set( _x, _y );
}