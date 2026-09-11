playsound = false

buttonfunction = function () {
    obj_processor.alarm[2] = 1
    layer_set_visible("menu_backstagemap",false)
	
	obj_player.active = true
	obj_hand.active = true
	global.canpause = true
	global.hideinventory = false
	
	audio_play_sound(snd_lever,0,false,1,0,random_range(0.5,0.6))
	
	mouse_clear(mb_left)
}