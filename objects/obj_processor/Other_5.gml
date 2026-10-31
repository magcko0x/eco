global.prevroom = room
if instance_exists(obj_transition) {
	global.prevEnID = obj_transition.enID
}

if instance_exists(obj_player) {
	global.prevplayerroomx = obj_player.x
	global.prevplayerroomy = obj_player.y
}