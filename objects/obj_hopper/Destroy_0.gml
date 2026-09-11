audio_play_sound(snd_burst,0,false,1,0,random_range(0.7,1.2))	
part_particles_burst(psystem[0],x,y,part_burst)
part_system_depth(psystem[0],depth)

if item != -1 {
	var itempickup = instance_create_depth(x,y,depth,obj_itempickup)	
	itempickup.item = item
}