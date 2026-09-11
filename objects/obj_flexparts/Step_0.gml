if keyboard_check_released(vk_escape) {
    layer_set_visible("menu_wardrobifier",false)
    global.interact = true
    obj_processor.update_pause()
}