if lightsout {
	if !instance_exists(obj_lightsout){
		instance_create_depth(x,y,depth,obj_lightsout)	
	}
}

if global.music != music global.music = music