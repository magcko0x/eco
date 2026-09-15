function get_item_loot_table() {
	//structure = [item id, weight]
	
	item_loot_table = [
		//nothing
			[-1,300],
		//battery
			["battery",50],
		//compass
			["compass",100],
        //save
            ["save",20],
		//green sun
			["green sun",1],
		//blossom
			["blossom",1]
	]
	
	if instance_exists(obj_rothandler) {
        //apple
		array_push(item_loot_table,["apple",5])
	}
	
	return item_loot_table
}