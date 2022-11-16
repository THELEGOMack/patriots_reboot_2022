function angle_rotate_lerp( src, dest, amount )
{
    return angle_rotate( src, dest, abs( angle_difference( dest, src ) * amount ) );
}