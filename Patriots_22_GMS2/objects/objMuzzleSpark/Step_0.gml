speed *= random_range(0.65, 0.9);
scaleXY -= random_range(0.04, 0.005) * sparkLifetime;
direction += random_range(20, -20);

if scaleXY <= 0
{
	instance_destroy();
}