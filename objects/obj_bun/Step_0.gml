setdepth()

door = instance_nearest(x,y,obj_door)
player = instance_nearest(x,y,obj_player)

if !global.interact {
	spd = 0
} else {
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 
	
	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}
	
    if player.safe {
        spd = 20 - slowdownspd
    } else {
        spd = 15 - slowdownspd
    }
}

if player.safe {
	audio_emitter_pitch(emitter,0.5)
} else {
	audio_emitter_pitch(emitter,1)
}

if instance_exists(door) {
	if mp_grid_path(global.path_grid, my_path, x, y, obj_door.x, obj_door.y, true) {
		path_start(my_path, spd, path_action_stop, false); 
	} else {
		spd = 0; 
    }
}

if place_meeting(x,y,obj_door) {
    if instance_exists(obj_bunhandler)
    	if owner.bun_amount = 0 && !stillhere
    		owner.bun_gone = true
	
	if !instance_exists(obj_lightsout) {
		instance_create_depth(-32,-32,depth,obj_lightsout)
		var myflash = instance_create_depth(-32,-32,depth,obj_flash)
		myflash.fade_color = c_black
		myflash.alpha_larper = 0.05
	}
	
	
	mp_grid_destroy(global.path_grid);
	path_delete(my_path)
	instance_destroy()
	
	exit
}

collision = collision_rectangle(0,y-14,room_width,y+40,obj_player,false,true)

if collision && !player.safe {
	if player.state != player.dead {
		global.diedto = "bun"
		player.state = player.dead
	}
}

if global.floor != -1 {
	stillhere = !array_contains(global.saferoomslist,global.rooms[global.currentroom])
	
	owner.still_here = stillhere
}

audio_emitter_position(emitter, x, y, 0)