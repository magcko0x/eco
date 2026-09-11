var player = instance_nearest(x,y,obj_player)
var distance = point_in_rectangle(obj_player.x,obj_player.y,x,y,x+32,y+40)
var myself = self

if global.interact {

	if image_index != 1 {
		
		if CLICKED {
			global.interact = false
			audio_play_sound_at(snd_dooropen,x,y,0,200,400,1,false,0)
			image_index = 1	
		}
		
	}
	
}

if image_index = 1 {
	if !instance_exists(obj_transition) {
		var tran = instance_create_depth(0,0,-8000,obj_transition)
		
		transitioncode()
		
		var xx = global.backstagedata[global.backstagey][global.backstagex].linkedcoords[0]
		var yy = global.backstagedata[global.backstagey][global.backstagex].linkedcoords[1]
		
		
		target_rm = global.backstage[yy][xx]
		
		global.backstagex = xx
		global.backstagey = yy
		
		tran.usetarget = true
		tran.enID = enID
		tran.target_rm = target_rm
	}
}