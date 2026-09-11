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
		inventory[_slot] = itemType;
		return [true,_slot]
	}
	else return [false,-1]
}

function inventory_swap(invfrom,slotfrom,invto,slotto) {
	var itemfrom = invfrom[slotfrom]
	invfrom[slotfrom] = invto[slotto]
	invto[slotto] = itemfrom
}