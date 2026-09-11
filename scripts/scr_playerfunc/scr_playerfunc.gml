global.playerhead = 0
global.playerbody = 0
global.playerpants = 0

function playerwalk(runiput,xinput,yinput,basespd){
		
		if xinput = 1 { xdir = -1 }
		if xinput = -1 { xdir = 1 }
		if yinput = -1 { ydir = -1 }
		if yinput = 1 { ydir = 1 }

		if xinput = -1 || xinput = 1 || yinput = -1 || yinput = 1 { 
			moving = true 
		} else moving = false
			
		/*
		//pausing
		var _pausekey = keyboard_check_pressed(vk_escape)

		if global.interact {
			if _pausekey && !instance_exists(obj_menu) {
				instance_create_depth(0,0,-8000,obj_menu)
			}
		}
		*/
		
		var runspd = basespd + basespd/2
		
		if runinput
			spd = runspd
		else spd = basespd
		
		move_and_collide(xinput * spd, yinput * spd, tag_get_asset_ids("solid",asset_object),4,0,0,spd,spd);
}

function getpartids(head,body,legs) {	
	switch head {
		//camera
		case 0:
			break;
		//rose
		case 1:
			break;
	}
	
	switch body {
		//white shirt
		case 0:
			break;
		//hawaiian shirt	
		case 1:
			break;
	}
	
	switch legs {	
		//jeans
		case 0:
			break;
		//red pants
		case 1:
			break;
	}
}