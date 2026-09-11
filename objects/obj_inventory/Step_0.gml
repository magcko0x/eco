for (var i = 0; i < INVENTORY_SLOTS; i++) {
    flip[i] = -flip[i]
    
    getitemstuff(obj_playerhandler.playerinventory[i],obj_playerhandler.playerinventory,i)
}

for (var i = 0; i < INVENTORY_SLOTS; i++) {
    pflip[i] = flip[i]
}

if global.interact {
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

/*
if instance_exists(obj_playerhandler){

	for (var i = 0; i < INVENTORY_SLOTS; i+= 1) {
		if i > 0 {
			var item = obj_playerhandler.playerinventory[i]
			
			if (obj_playerhandler.playerinventory[i-1] = -1) {
				obj_playerhandler.playerinventory[i-1] = item
				obj_playerhandler.playerinventory[i] = -1
			}
		}
	}

}
*/


if instance_exists(obj_playerhandler)
	getitemstuff(obj_playerhandler.playerinventory[pos],obj_playerhandler.playerinventory,pos)