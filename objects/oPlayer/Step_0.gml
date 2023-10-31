/// @description Insert description here
// You can write your code in this editor

// keyboard_check() will return 0 if the key is not being pressed
//						 return 1 if the key is being pressed
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_up);

// Calculate the movement
var _move = key_right - key_left;

hsp = _move * walksp;

x = x + hsp;





