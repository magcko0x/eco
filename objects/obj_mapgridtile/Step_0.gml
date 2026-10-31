if global.floor == "floor_backstage" {
	if variable_instance_exists(id,"stagex") && variable_instance_exists(id,"stagey") {
		if global.backstagex == stagex && global.backstagey = stagey {
			image_blend = c_orange	
		} else if instance_exists(obj_unbornhandler) && (obj_unbornhandler.backstagex == stagex && obj_unbornhandler.backstagey = stagey){
			image_blend = c_red
		} else if global.backstage[stagey][stagex] = rm_backstage_basic_intro{
			image_blend = c_green
		} else {
			image_blend = c_gray
		}
	}
}