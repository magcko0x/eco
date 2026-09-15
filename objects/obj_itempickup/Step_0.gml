setdepth(depthoffset)

var frequency,amplitude

frequency = 0.12
amplitude = 5

timer += frequency;

var y_offset = sin(timer) * amplitude;

var angle_offset = cos(timer) * amplitude

z = y_offset

false_angle = y_offset + angle_offset

mylight.x = x
mylight.y = y + z + z_offset

if global.interact {
	if CLICKED {
		if inventory_add(obj_playerhandler.playerinventory,item)[0] {
			audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0)
			destroyed = true
			instance_destroy()
		} else {
			audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0)
			
			var tempitem = obj_playerhandler.playerinventory[obj_inventory.pos]
			obj_playerhandler.playerinventory[obj_inventory.pos] = item
			item = tempitem
		}
	}
}