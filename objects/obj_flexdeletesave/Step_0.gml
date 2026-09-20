if keyboard_check_pressed(vk_escape) {
	keyboard_clear(vk_escape)
    obj_processor.paused = false
    obj_processor.alarm[2] = 1
    layer_set_visible("menu_delete_save",false)
    global.interact = true
}