if (global.inbackstage) {
	
	// Ensure our stage coordinates are initialized and valid
	if variable_instance_exists(id,"stagex") && variable_instance_exists(id,"stagey") {
		if (stagex >= 0 && stagey >= 0) {
		
			// Look up if our current grid tile matrix slot has any history container stored
			var _room_container = global.room_states[stagey][stagex];
		
			if (_room_container != undefined) {
			
				// Reconstruct our unique identity key string to look for a matching log
				var _editor_key = unique_id;
			
				// Check if this specific instance has saved properties in the container
				if (variable_struct_exists(_room_container, _editor_key)) {
					var _saved_data = variable_struct_get(_room_container, _editor_key);
				
					// Rule 1: If it was logged with item = -1 or marked dead, destroy it immediately
					if (!_saved_data.exists) {
						instance_destroy(id, false); // 'false' avoids running the Clean Up logic on deletion
						instance_destroy(mylight)
						exit;
					}
				
					// Rule 2: If it does exist, reconstruct its attributes perfectly, overwriting the defaults
					x = _saved_data.saved_x;
					y = _saved_data.saved_y;
					item = _saved_data.saved_item;
				}
			}
		}
	}
}