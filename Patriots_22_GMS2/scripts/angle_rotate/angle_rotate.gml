function angle_rotate( src, dest, amount )
{ 
    return src + clamp( angle_difference( dest, src ), -amount, amount );
}