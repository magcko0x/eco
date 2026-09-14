depth = 5000
if place_meeting(x,y,tag_get_asset_ids("solid",asset_object)) || place_meeting(x,y,obj_drool){
	instance_destroy()	
}

if layer_exists("Tiles_1") {
		var _lay_id = layer_get_id("Tiles_1");
		var _tile_id = layer_tilemap_get_id(_lay_id);
		var _tile = tilemap_get(_tile_id, x div 32, y div 32)
		if tile_get_empty(_tile) {
			instance_destroy()
		}
}

image_alpha = 10

slowdownspd = 3

startxscale = image_xscale
startyscale = image_yscale