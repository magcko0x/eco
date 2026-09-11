function createbackstage(width,height) {
	roomslist = [rm_backstage_basic]

	mapgrid = array_create(height); 

	roomslist = [rm_backstage_basic];

	for (var j = 0; j < height; j++) {
		mapgrid[j] = array_create(width); 
    
		for (var i = 0; i < width; i++) {
			mapgrid[j][i] = roomslist[irandom(array_length(roomslist)-1)];
		}
	}

	var middle_col = width div 2
	var bottom_row = height - 1

	mapgrid[bottom_row,middle_col] = rm_backstage_basic_intro

	global.backstage = mapgrid
}

instance_destroy()