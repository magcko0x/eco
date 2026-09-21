setdepth()

if CLICKED {
	global.interact = false
	layer_set_visible("menu_delete_save",true)
	instance_deactivate_all(false)
	instance_activate_object(obj_processor)
	instance_activate_object(obj_lightsout)
}