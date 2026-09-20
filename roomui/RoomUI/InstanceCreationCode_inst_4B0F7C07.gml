buttonfunction = function () {
	if file_exists("save.sav") {
		file_delete("save.sav")
	}
	
	layer_set_visible("menu_delete_save",false)
	
	game_restart()
}