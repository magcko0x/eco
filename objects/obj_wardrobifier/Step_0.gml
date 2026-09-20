setdepth()

if CLICKED {
    global.interact = false
    layer_set_visible("menu_wardrobifier",true)
    audio_play_sound(snd_dooropen,0,false)
    instance_deactivate_all(false)
    instance_activate_object(obj_processor)
}