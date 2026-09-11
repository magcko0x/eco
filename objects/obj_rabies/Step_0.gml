setdepth()

if global.interact {
	
	mylight.x = x
	mylight.y = y	
	
	part_particles_burst(psystem[0],x,y,part_rabiesfog)
		
	part_system_depth(psystem[0],depth + 50)
	
	if spd < maxspd {
		spd += 0.25	
	} else {
		spd -= 0.25	
	}
	
	if !audio_is_playing(ambientsfx) {
		ambientsfx = audio_play_sound_at(snd_rabies_ambience,x,y,0,300,600,1,false,0,2)
    }
	
	if CLICKED {
		
		part_particles_burst(psystem[0],x,y,part_burst)
		
		part_system_depth(psystem[0],depth)
	
		audio_play_sound(snd_punch,0,false,1,0,random_range(0.7,1.2))
		audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))
		
		instance_destroy()
		audio_stop_sound(ambientsfx)
		instance_create_depth(x,y,-10000,obj_flash)
	}		
	
	timerspd = ( (point_distance(x,y,target.x,target.y) < 128 && !spew) * 4) + 1
	
	if spewtimer > 0 {
		spewtimer -= timerspd
	} else {
		spewtimer = 300
		spew = -spew	
	}
    
	if spew {
		sprite_index = spr_rabiesspit
		
		if instance_number(obj_droolball) < 20 {
			instance_create_depth(x,y,depth,obj_droolball)	
		}
		
	} else {
		sprite_index = spr_rabies	
	}
	
	ipx = target.x
	ipy = target.y
	var xdiff = ipx-x;
	var ydiff = ipy-y;
	var dir = point_direction(x,y,ipx,ipy);
	var dist = point_distance(x,y,ipx,ipy);
	x += lengthdir_x(min(spd,abs(xdiff)),dir);
	y += lengthdir_y(min(spd,abs(ydiff)),dir);	
	
	var infected = instance_place(x,y,tag_get_asset_ids("infectable",asset_object))
	
	if infected {
		if instance_exists(obj_mothervirushandler) {
			if array_contains(obj_mothervirushandler.viruses,"rabies") {
				array_delete(obj_mothervirushandler.viruses,array_get_index(obj_mothervirushandler.viruses,"rabies"),1)
			}
		}
		
		var myhandler = instance_create_depth(x,y,depth,obj_virushandler)
		myhandler.virus = "rabies"
		myhandler.infected = infected.object_index
		audio_stop_sound(ambientsfx)

		infectsfx = audio_play_sound_at(snd_rabies_infect,x,y,0,300,600,1,0,false)
		
		instance_destroy()
		
		var myflash = instance_create_depth(0,0,depth,obj_spriteflash)
		myflash.sprite_index = sprite_index
		myflash.image_speed = 0
	}
}