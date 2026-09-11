buttonfunction = function () {
    mouse_clear(mb_left)
    obj_processor.paused = false
    obj_processor.alarm[2] = 1
    layer_set_visible("menu_pause",false)
    global.interact = true
}