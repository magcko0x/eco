if (global.inbackstage) {
	// Ensure coordinates are valid before writing to the array
	if variable_instance_exists(id,"stagex") && variable_instance_exists(id,"stagey") {
		if (stagex >= 0 && stagey >= 0) {
		
			// Initialize the structural container for this grid slot if it's currently empty
			if (global.room_states[stagey][stagex] == undefined) {
				global.room_states[stagey][stagex] = {};
			}
		
			var _room_container = global.room_states[stagey][stagex];
			var _editor_key = unique_id; 
		
			// Save state data based on whether item was harvested or empty
			if (item == -1 || destroyed) {
				variable_struct_set(_room_container, _editor_key, {
					exists: false
				});
			} 
			else {
				variable_struct_set(_room_container, _editor_key, {
					exists: true,
					saved_x: x,
					saved_y: y,
					saved_item: item
				});
			}
		}
	}
}