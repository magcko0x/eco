if global.interact {
	mylight.x = x
	mylight.y = y	
	
	if CLICKED || RANINTO{
		
		audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0)
		
		if instance_exists(obj_rottimer) {
			var me = self
			
			var myeffect = instance_create_depth(0,0,-9000,obj_rottimeraddthingy)
			
			myeffect.timer = timeradd
			
			with obj_rottimer {
				timer += me.timeradd	
			}
		}
		
		instance_destroy()
	}
}