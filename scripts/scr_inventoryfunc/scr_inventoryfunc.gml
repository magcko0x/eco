function inventory_search(inventory,itemType) {
	for (var i = 0; i < INVENTORY_SLOTS; i++) {
		if (inventory[i] == itemType) {
			return(i)
		}	
	}
	return(-1)
}

function inventory_remove(inventory,slot,emptyItem = -1) {
	inventory[slot] = emptyItem;
}

function inventory_add(inventory,itemType,emptyItem = -1) {
	var _slot = inventory_search(inventory,emptyItem)
	if (_slot != -1) {
		inventory[_slot] = variable_clone(itemType);
		return [true,_slot]
	}
	else return [false,-1]
}

function inventory_swap(invfrom,slotfrom,invto,slotto) {
	var itemfrom = invfrom[slotfrom]
	invfrom[slotfrom] = invto[slotto]
	invto[slotto] = itemfrom
}

function get_item_definition(_name) {
	for (var i = 0; i < array_length(global.itemlist); i++) {
		if string_lower(global.itemlist[i].name) == string_lower(_name)
			return global.itemlist[i]
	}
	return -1
}

#macro USE mouse_check_button_pressed(mb_right) && obj_hand.state = obj_hand.free