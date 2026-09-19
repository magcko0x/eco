mylight = instance_create_depth(x,y,depth,obj_light)
mylight.owner = self
mylight.radius = 64

color = c_white
owner = noone
maxdist = 4*32
currentdist = 0
far = false
shake_strength = 0
image_speed = 0
angle = 0
dist = point_distance(x,y,obj_player.x,obj_player.y)

selecting = false
alpha = 1
flicker_timer = 0
iframe = 300
flicker_speed = 0.25

shakex = 0
shakey = 0

selectedobj = instance_place(x,y,tag_get_asset_ids("selectable",asset_object))

shakesound = snd_myxo_chase

layer_create(depth,"Particles")
psystem[0] = part_system_create_layer("Particles",false);

grabbedobj = noone
prevgrabbedobj = grabbedobj

active = true

drawitem = false

invincibletimer = 0

free = function() {
	x = mouse_x
	y = mouse_y

	if !instance_exists(obj_soulline) {
		myline = instance_create_depth(x,y,depth,obj_soulline)
		myline.owner = self
	}
	
	if !instance_exists(grabbedobj) grabbedobj = noone
	
	drawitem = false
	
	if grabbedobj = noone {
		selectedobj = instance_place(x,y,tag_get_asset_ids("selectable",asset_object))
	} else {
		selectedobj = noone	
	}
	
	if grabbedobj != noone {
		image_index = grabbedobj.cursor
		
		if variable_instance_exists(grabbedobj,"drawitem") {
			drawitem = grabbedobj.drawitem	
		}
	}
	
	if selectedobj && instance_exists(selectedobj) && selectedobj.deac = false{
		var selector = selectedobj
		image_index = selector.cursor
		if variable_instance_exists(selector,"drawitem") {
			drawitem = selector.drawitem	
		}
		
		if grabbedobj == noone
			angle = point_direction(x,y,selector.x,(selector.y - selector.sprite_yoffset + selector.sprite_height/2)) - 90
	} else if grabbedobj = noone {
        image_index = 0
        angle = point_direction(x,y,obj_player.x,obj_player.y) + 90
    } 
	
	if dist > maxdist {
		state = far
		shake_strength = 4
	}
	
	prevgrabbedobj = grabbedobj	
}

far = function() {
	x = mouse_x
	y = mouse_y	
	image_index = 2
	angle = 0

	if instance_exists(obj_soulline) {
		instance_destroy(myline)
	}
	
	if dist < maxdist {
		state = free
		shake_strength = 4
	} 
}

disabled = function() {
	x = mouse_x
	y = mouse_y	
	image_index = 5
	
	angle = 0

	if instance_exists(obj_soulline) {
		instance_destroy(myline)
	}

	if point_distance(x,y,xprevious,yprevious) > 32 {
		timersub = point_distance(x,y,xprevious,yprevious) / 8
		shake_strength = 8
		shakesound = audio_play_sound(snd_myxo_chase,0,false,1,0,random_range(1.8,2.4))
		
		part_particles_burst(psystem[0],x,y,part_sweat)
		
		part_system_depth(psystem[0],-9000)
	} else {
		audio_stop_sound(shakesound)
		timersub = 1	
	}

	if iframe > 0 {
		iframe -= timersub
	}
	
	if iframe <= 0 {
		audio_play_sound(snd_hand_enable,0,false)
		state = free
		iframe = 300
		invincibletimer = 60
		shake_strength = 4
	}
}

state = free
prevstate = state