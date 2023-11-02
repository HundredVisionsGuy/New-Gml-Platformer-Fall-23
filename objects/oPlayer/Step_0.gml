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