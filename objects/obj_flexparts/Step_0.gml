if keyboard_check_pressed(vk_escape) {
	keyboard_clear(vk_escape)
	
    layer_set_visible("menu_wardrobifier",false)
    global.interact = true
    obj_processor.update_pause()
}