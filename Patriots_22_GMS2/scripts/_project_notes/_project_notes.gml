/* 26 May 2022
Remember that ORDER MATTERS!

Small things to fix:
- Door furniture collision
- Shooting through walls when up against them
- Weapon + wall bouncing
- Add empty weapon sprites (image_index = 1)

Danny:
By the way, especially if you’re gonna have a LOT of weapons, you might be able to do this without a switch statement at all…
If you can figure out the name of your weapon, and character/enemy sprite naming scheme is very consistent, you could just replace the name of the held weapon in the player sprite with the name of the weapon sprite
Consider using instance_nearest to find your _inst, and then you can do instance_place with _inst instead of objWeapon, or, better for gameplay, figure out if _inst is within a certain distance from the player
