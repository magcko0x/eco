setdepth()

if CLICKED && !deac{
	
	if instance_exists(obj_unbornhandler) {
		obj_unbornhandler.bannedtiles[# global.backstagex,global.backstagey] = true	
	}
	
	image_index = 1
	deac = true	
}