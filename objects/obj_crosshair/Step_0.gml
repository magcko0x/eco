if owner.state = owner.circling {
	if owner.timer > 25 {
		if instance_exists(obj_player) {
			x = obj_player.x
			y = obj_player.y
		}
	}
}

if !instance_exists(owner)
	instance_destroy()