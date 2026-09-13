function get_item_loot_table() {
	//structure = [item id, weight]
	
	item_loot_table = [
		//nothing
			[-1,300],
		//battery
			[0,50],
		//compass
			[1,100],
        //save
            [3,20],
		//green sun
			[6,1],
		//blossom
			[7,1]
	]
	
	if instance_exists(obj_rothandler) {
        //apple
		array_insert(item_loot_table,array_length(item_loot_table)-1,[2,5])	
	}
	
	return item_loot_table
}