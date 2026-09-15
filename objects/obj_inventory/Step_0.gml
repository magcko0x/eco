

if global.interact && instance_exists(obj_player) && instance_exists(obj_playerhandler) {
	
	if keyboard_check_pressed(vk_backspace) && obj_playerhandler.playerinventory[pos] != -1 {
		var droppeditem = instance_create_depth(obj_player.x,obj_player.y,depth,obj_itempickup)
		droppeditem.item = variable_clone(obj_playerhandler.playerinventory[pos])
		obj_playerhandler.playerinventory[pos] = -1
	}
	
	for (var i = 0; i < INVENTORY_SLOTS; i++) {
	
			if struct_exists(obj_playerhandler.playerinventory[i],"update_function")
				obj_playerhandler.playerinventory[i].update_function(obj_playerhandler.playerinventory,i,pos)

	}

	if USE {
		if struct_exists(obj_playerhandler.playerinventory[pos],"use_function")
			obj_playerhandler.playerinventory[pos].use_function(obj_playerhandler.playerinventory,pos)
	}	
	
	if instance_exists(obj_hand) {
		if obj_hand.active {
			if mouse_wheel_down()
				pos++

			if mouse_wheel_up()
				pos-- 
		}
	}
}

for (var i = 0; i < 5; i++) {
	if keyboard_check(ord(i+1)) {
		pos = i	
	}
}

if pos >= inventorylength {pos = 0}
if pos < 0 {pos = inventorylength-1}

if global.credits > 0 && !showcredits showcredits = true