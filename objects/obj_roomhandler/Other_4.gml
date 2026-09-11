if room = rm_death {
    instance_destroy()
    exit
}

if global.floor != -1 {
	
	//music switch
	switch global.floor {
		case 0:
			if global.music != mus_friendofafriend
				global.music = mus_friendofafriend
			break;
		case 1:
			if global.music != mus_tvworld
				global.music = mus_tvworld
			break;
	}
	
	//show titlecards
	
	if global.currentroom == 0 {
		switch global.floor {
			case 0:
				var titlecard = instance_create_depth(0,0,depth,obj_titlecard)
				titlecard.titlecardsprite = spr_floor_1_name
			break;
			
			case 1:
				var titlecard = instance_create_depth(0,0,depth,obj_titlecard)
				titlecard.titlecardsprite = spr_floor_2_name
			break;			
		}
	}
	
	//part switch
	switch global.floor {
		case 0:
			if global.currentroom >= 50 {
				global.part = 1
			}
			break;
	}
	
	
	
	if global.darkrooms[global.currentroom] = true {
		instance_create_depth(x,y,depth,obj_lightsout)
	    if global.floor = 1 && instance_exists(obj_lightsout){
	        gradient = layer_get_fx("Background")
        
	        if gradient != -1 {
	            gradientparams = fx_get_parameters(gradient)
            
	            gradientparams.g_GradientColour1 = [51/255,61/255,109/255,255/255]
	            gradientparams.g_GradientColour2 = [75/255,90/255,178/255,255/255]
            
	            fx_set_parameters(gradient, gradientparams);
	        }
	    }
	}
	
	get_rooms_list(global.floor,global.part)
	
} else if global.inbackstage{
	if global.backstagedata[global.backstagey][global.backstagex].darkroom {
		if !instance_exists(obj_lightsout) {
			var light = instance_create_depth(x,y,depth,obj_lightsout)
			light.darkness = 0.6
		} else {
			obj_lightsout.darkness = 0.6
		}
	}
}