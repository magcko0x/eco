if global.interact {
	mylight.x = x
	mylight.y = y	
	
	if CLICKED || RANINTO{
		
		audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0)
		
		if instance_exists(obj_rottimer) {
			var me = self
			
			var myeffect = instance_create_depth(0,0,depth,obj_rottimeraddthingy)
			
			if timeradd = MINUTE/2 {
				myeffect.variant = 0
			} else {
				myeffect.variant = 1
			}
			
			with obj_rottimer {
				timer += me.timeradd	
			}
		}
		
		instance_destroy()
	}
}