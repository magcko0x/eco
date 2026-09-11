var player = instance_nearest(x,y,obj_player)
var distance = point_in_rectangle(obj_player.x,obj_player.y,x,y,x+32,y+40)
var myself = self

if global.interact {
	if place_meeting(x,y,player){
		global.interact = false
		if !instance_exists(obj_transition) {
			transitioncode()
			var tran = instance_create_depth(0,0,-8000,obj_transition)
			tran.usetarget = true
			tran.enID = enID 
			tran.roomgoto = roomgoto
			tran.target_rm = target_rm
			tran.changedir = true
			tran.xdir = player.xdir
			tran.ydir = player.ydir
		}
	}
}