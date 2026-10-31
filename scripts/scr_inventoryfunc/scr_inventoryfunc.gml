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

function get_item_definition(_name,_tag = "name",_list = global.itemlist,_return_struct = false) {
	if !is_array(_list[0]) {
		for (var i = 0; i < array_length(_list); i++) {
			if is_struct(_list[i]) && struct_exists(_list[i],_tag) && string_lower(struct_get(_list[i],_tag)) == string_lower(_name) {
				if !_return_struct {
					return _list[i]
				} else {
					var _struct =
					{
						name : _name,
						tag : _tag,
						list : _list
					}
				
					return _struct	
				}
			}
		}
	} else {
		for (var j = 0; j < array_length(_list); j++) {
			for (var i = 0; i < array_length(_list[j]); i++) {
				if is_struct(_list[j][i]) && struct_exists(_list[j][i],_tag) && string_lower(struct_get(_list[j][i],_tag)) == string_lower(_name) {
					if !_return_struct {
						return _list[j][i]
					} else {
						var _struct =
						{
							name : _name,
							tag : _tag,
							list : _list[j]
						}
				
						return _struct	
					}
				}
			}
		}
	}
	return -1
}

#macro USE mouse_check_button_pressed(mb_right) && obj_hand.state = obj_hand.free