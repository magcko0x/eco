setdepth()

if global.interact {
	if !vanishing {
		if CLICKED {
			if instance_exists(obj_playerhandler) && instance_exists(obj_inventory) {
				if item = -1 {
					if obj_playerhandler.playerinventory[obj_inventory.pos] != -1 {
						audio_play_sound_at(snd_swap,x,y,0,100,200,1,false,0)
						item = obj_playerhandler.playerinventory[obj_inventory.pos]
						obj_playerhandler.playerinventory[obj_inventory.pos] = -1
						global.time_capsule_item = item
						custom_save()
					}
				} else {
					if inventory_add(obj_playerhandler.playerinventory,item)[0] {
						audio_play_sound_at(snd_swap,x,y,0,100,200,1,false,0)
						audio_play_sound_at(snd_water_grow,x,y,0,100,200,1,false,0)
						item = -1
						global.time_capsule_item = item
						custom_save()
						vanishing = true
					} else {
						audio_play_sound_at(snd_swap,x,y,0,100,200,1,false,0)
						audio_play_sound_at(snd_water_grow,x,y,0,100,200,1,false,0)
						var tempitem = obj_playerhandler.playerinventory[obj_inventory.pos]
						obj_playerhandler.playerinventory[obj_inventory.pos] = item
					
						item_to_launch = instance_create_depth(x,y,depth,obj_itempickup)
						item_to_launch.item = tempitem
						
						launching_item = true
					
						item = -1
					
						global.time_capsule_item = item
						custom_save()
						vanishing = true
					}
				}
			}
		}
	}
	
	drawitem = obj_playerhandler.playerinventory[obj_inventory.pos] != -1 && item == -1
	
	deac = (obj_playerhandler.playerinventory[obj_inventory.pos] == -1 && item == -1) || vanishing
}

var item_frequency,item_amplitude,frequency,amplitude

item_frequency = 0.06
item_amplitude = 4

timer += item_frequency

var item_y_offset = sin(timer) * item_amplitude;

var item_angle_offset = cos(timer) * item_amplitude

item_z = item_y_offset

item_false_angle = item_y_offset + item_angle_offset

mylight.y = y + z + item_y_offset

item_frequency = 0.06
item_amplitude = 3

timer += item_frequency

var y_offset = sin(timer) * item_amplitude

z = y_offset

false_angle++

mylight.y = y + z + z_offset

if launching_item {
	item_yforce = lerp(item_yforce,0,0.2)
	
	with item_to_launch {
		y += other.item_yforce	
	}
	
	if item_yforce <= 0.2 {
		launching_item = false	
	}
}

if vanishing {
	image_xscale = lerp(image_xscale, 0,0.3)
	image_yscale = lerp(image_yscale, 0,0.3)
	
	mylight.radius = lerp(mylight.radius,0,0.2)

	if image_xscale < 0.01 && image_yscale < 0.01 && !launching_item{
		instance_destroy()
	}
}