deac = false
cursor = 1

if instance_exists(obj_unbornhandler) {
	
	if obj_unbornhandler.bannedtiles[# global.backstagex,global.backstagey] {
		image_index = 1
		deac = true	
	}
}