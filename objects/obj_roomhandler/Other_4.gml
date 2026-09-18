if room = rm_death {
    instance_destroy()
    exit
}

if global.floor != -1 {
	
	//spawn credits
	var chance = irandom(5)

	if chance == 0 {
	
		var creditamount = 1 + floor(power(random(1), 2) * 19)
	
		repeat creditamount {
			spawn_across_area(obj_credit, obj_spawnzone, collist)
		}
	}	
	
	
	//music switch
	
	var music_list = 
	[
		mus_friendofafriend,
		mus_deviled_gardens
	]
	
	var current_floor_music = music_list[clamp(global.floor,0,array_length(music_list)-1)]
	
	if global.music != current_floor_music
		global.music = current_floor_music	
	
	
	//show titlecards
	
	if global.currentroom == 0 {
		
		var titlecard_list = 
		[
			spr_floor_1_name,
			spr_floor_2_name
		]
		
		var titlecardsprite = titlecard_list[clamp(global.floor,0,array_length(titlecard_list)-1)]
		
		var titlecard = instance_create_depth(0,0,depth,obj_titlecard)
		titlecard.titlecardsprite = titlecardsprite
	}
	
	if is_struct(global.rooms[global.currentroom]) {
		if struct_exists(global.rooms[global.currentroom],"dark") {
			if global.rooms[global.currentroom].dark = true {
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
		}
	}
	
	//get_rooms_list(global.floor,global.part)
	
} else if global.inbackstage {
	if global.backstagedata[global.backstagey][global.backstagex].darkroom {
		if !instance_exists(obj_lightsout) {
			var light = instance_create_depth(x,y,depth,obj_lightsout)
			light.darkness = 0.6
		} else {
			obj_lightsout.darkness = 0.6
		}
	}
}

