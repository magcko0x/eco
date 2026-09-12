/*

if key && !instance_exists(obj_key_GUI)
	instance_create_depth(x,y,depth,obj_key_GUI)

if !key && instance_exists(obj_key_GUI)
	instance_destroy(obj_key_GUI)
	
*/

global.credits = clamp(global.credits,0,999)