if lightsout {
	if !instance_exists(obj_lightsout){
		instance_create_depth(x,y,depth,obj_lightsout)	
	}
}

global.music = music