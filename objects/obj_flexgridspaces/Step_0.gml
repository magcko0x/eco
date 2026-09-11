if keyboard_check_released(vk_escape) || (instance_exists(obj_player) && obj_player.state = obj_player.dead) {
    layer_set_visible("menu_backstagemap",false)
	
	if keyboard_check_released(vk_escape)
		audio_play_sound(snd_lever,0,false,1,0,random_range(0.5,0.6))
	
	if instance_exists(obj_player) {
		obj_player.active = true
		obj_hand.active = true
	}
	
	keyboard_clear(vk_escape)
	
	global.canpause = true
	global.hideinventory = false
}