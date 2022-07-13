legIndex += speed*0.1
legAngle = direction

if !place_free(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction))
    {
    direction+=10
    }
else
    {
    if abs(frac(direction*(1/90)))>0 direction+=10
    }