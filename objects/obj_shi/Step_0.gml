setdepth()

if global.interact {
	state()

	if place_meeting(x,y,obj_player){
		if obj_player.state != obj_player.dead {
			global.diedto = "shi"
			obj_player.state = obj_player.dead
		}
	}
	
}