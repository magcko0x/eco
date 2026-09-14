owner = noone




ydir = 1
xdir = 1

if obj_player.ydir = -1 {
	headframe = 2 * obj_player.head + 1
	bodyframe = 2 * obj_player.body + 1
	pantsframe = 4 * obj_player.pants + 2 + obj_player.frame
	ydir = -1
	xdir = obj_player.xdir
}

if obj_player.ydir = 1 {
	headframe = 2 * obj_player.head
	bodyframe = 2 * obj_player.body 
	pantsframe = 4 * obj_player.pants + obj_player.frame
	ydir = 1
	xdir = obj_player.xdir
}


switch irandom(2){
	case 0:
		col = c_red
	case 1:
		col = c_green
	case 2:
		col = c_blue
}