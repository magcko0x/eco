mylight = instance_create_depth(x,y,depth,obj_light)
mylight.owner = self
mylight.radius = 64

timer = 0

spd = 0
basespd = 5
addspd = 0

xdir = 1
ydir = -1
img = 0
moving = false
sintimer = 1
spr_y = 1
sinmult = 0.05
frame = 0
hp = 100
shaking = false
shake_strength = 0
safe = false
steptimer = irandom_range(5,10)

myhand = instance_create_depth(x,y,-9000,obj_hand)
myhand.owner = self

alpha = 1
flicker_timer = 0;
flicker_speed = 2;
iframe = 60

xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
interactinput = keyboard_check_released(ord("E"))
jumpinput = keyboard_check(vk_space);
runinput = keyboard_check(vk_shift);

head = global.playerhead
body = global.playerbody
pants = global.playerpants

getpartids(head,body,pants)

headframe = 0
bodyframe = 0
pantsframe = 0

active = true

protected = false

//AB. MACHINE
none = function()
{
	
}

//STATE MACHINE
dead = function ()
{
	if !protected {
		//behaviour
		audio_stop_all()
		
		global.inbackstage = false
		global.floor = -1
	
		if !instance_exists(obj_transition) {
			var tran = instance_create_depth(0,0,-8000,obj_transition)
			tran.current_alpha = 0.9
			tran.usetarget = true
			tran.enID = 0 
			tran.roomgoto = 0
			tran.target_rm = rm_death
			tran.changecurrentroom = true
		}
		
		for (var i = 0; i < array_length(obj_playerhandler.playerinventory); i++) {
			obj_playerhandler.playerinventory[i] = -1
		}
		
		obj_inventory.showcredits = false
		
		global.credits = 0
	}
	
}

free = function ()
{
	//behaviour
	alpha = 1;
	ability()
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 
	
	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}
	
	if myhand.state = myhand.free
		playerwalk(runinput,xinput,yinput,basespd + addspd - slowdownspd)
}

/*
hurt = function ()
{
	ability()
	if myhand.state = myhand.free
		playerwalk(runinput,xinput,yinput,basespd)
	
	if !instance_exists(obj_hpdisplay) {
		instance_create_depth(0,0,-8000,obj_hpdisplay)	
	}
	
	if iframe > 0 {
		iframe--
		
	    flicker_timer++;
	    if (flicker_timer >= flicker_speed * 2)
	    {
	        flicker_timer = 0;
	    }

	    if (flicker_timer < flicker_speed)
	    {
	       alpha = 1
	    }
	    else
	    {
	        alpha = 0
	    }
		
	}
	if iframe <= 0 {
		state = free
	}
}
*/

ability = none
state = free