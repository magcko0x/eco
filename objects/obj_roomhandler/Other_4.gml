if room = rm_death {
    instance_destroy()
    exit
}


if global.floor != "lobby" {	
	//spawn credits
	var chance = irandom(5)

	if chance == 0 {
	
		var creditamount = 1 + floor(power(random(1), 2) * 19)
	
		repeat creditamount {
			spawn_across_area(obj_credit, obj_spawnzone, collist)
		}
	}
}
	
	
//music switch

	
var current_floor_music = -1
	
switch global.floor {
	case "floor_industry":
		current_floor_music = mus_friendofafriend
		break;
			
	case "floor_floating_plateau":
		current_floor_music = mus_deviled_gardens
		break;
		
	case "floor_backstage":
		current_floor_music = mus_black
		break;
}
	
if global.currentroom >= 0
	global.music = current_floor_music	
	
	
//show titlecards
	
if global.currentroom == 0 {
		
	var titlecardsprite = spr_null
	
	switch global.floor {
		case "floor_industry":
			titlecardsprite = spr_floor_industry_name
			break;
			
		case "floor_floating_plateau":
			titlecardsprite = spr_floor_floating_plateau_name
			break;			
	}
		
	var titlecard = instance_create_depth(0,0,-10000,obj_titlecard)
	titlecard.titlecardsprite = titlecardsprite
}
	
if is_struct(global.rooms[global.currentroom]) {
	if struct_exists(global.rooms[global.currentroom],"dark") {
		if global.rooms[global.currentroom].dark = true {
			instance_create_depth(x,y,depth,obj_lightsout)
			if global.floor = "floor_floating_plateau" && instance_exists(obj_lightsout){
			    gradient = layer_get_fx("Background")
        
			    if gradient != -1 {
			        gradientparams = fx_get_parameters(gradient)
            
			        gradientparams.g_GradientColour1 = [51/255,61/255,109/255,255/255]
			        gradientparams.g_GradientColour2 = [75/255,90/255,178/255,255/255]
            
			        fx_set_parameters(gradient, gradientparams);
			    }
			}
		}
	}
	
	//get_rooms_list(global.floor,global.part)
	
}

