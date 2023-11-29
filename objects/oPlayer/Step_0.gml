/// @description Insert description here
// You can write your code in this editor

// keyboard_check() will return 0 if the key is not being pressed
//						 return 1 if the key is being pressed
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_up);


// Calculate the movement
var _move = key_right - key_left;

// calculate horizontal speed
hsp = _move * walksp;

// Apply gravity
vsp = vsp + grv;

// Jump Mechanic - you can only jump from a platform
if (place_meeting(x, y+1, oWall) && key_jump)
{
	vsp = -jumpsp;
}
/*if (check_collision(-1, 0))
{
        wall_direction = -1;
        alarm[1] = 10;
}
*/
// Horizontal collision - are we colliding with a wall to the left or right?
if ( place_meeting(x+hsp, y, oWall) ) 
{
	// stop just in front of (or behind) the object
	// Loop 1pixel at a time towards the wall until
	//		we are 1 pixel away
	while (!place_meeting(x + sign(hsp), y, oWall) )
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

// change x by the horizontal speed
x = x + hsp;

// Vertical Collision
if ( place_meeting(x, y+vsp, oWall) )
{
	while ( !place_meeting(x, y+sign(vsp), oWall) )
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Animation States
// Are Not on a platform? We are jumping or falling
if (!place_meeting(x, y+1, oWall))
{
	sprite_index = sPlayerJump;
	image_speed = 0;
	// jumping or falling?
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	// Are we standing still or moving (left or right)?
	if (hsp == 0)
	{
		// we are not moving left or right (we are idle)
		sprite_index = sPlayerIdle;
	}
	else
	{
		sprite_index = sPlayerWalk;
	}
}

// Flip our sprite to the left (-1) or right (1) using x-scale
if (hsp != 0) image_xscale = sign(hsp);

// Particle effect attempt #1
if (sign(hsp) != 0 or sign(vsp) != 0) { 
	effect_create_below(ef_flare, x, (y+30), 2, c_red);	
}