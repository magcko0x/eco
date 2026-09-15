function load_settings() {
	ini_open("settings");
	
	// Volume
	global.mastervolume = ini_read_real("volume", "mastervolume", 1);
	global.musicvolume  = ini_read_real("volume", "musicvolume", 1);
	global.sfxvolume    = ini_read_real("volume", "sfxvolume", 1);
	
	ini_close();
}

function create_save() {
	if !file_exists("save.sav") {
		var savestruct = {
			player: [0, 0, 0],
			maxfloor: -1,
			unlockedentities: [],
			time_capsule_item: -1 // Sets default to empty
		}
		
		var structjson = json_stringify(savestruct, true)
		
		var _file = file_text_open_write("save.sav")
		file_text_write_string(_file, structjson)
		file_text_close(_file)
	}
}

function custom_save() {

	var _saved_item = -1
	
	if is_struct(global.time_capsule_item) {
		_saved_item = { name: global.time_capsule_item.name }
		
		if variable_struct_exists(global.time_capsule_item, "dynamic") {
			_saved_item.dynamic = global.time_capsule_item.dynamic
		}
	}
	

	var savestruct = {
		player: [global.playerhead, global.playerbody, global.playerpants],
		maxfloor: global.maxfloor,
		unlockedentities: global.unlockedentities,
		time_capsule_item: _saved_item 
	}
	
	var structjson = json_stringify(savestruct, true)
	
	var _file = file_text_open_write("save.sav")
	file_text_write_string(_file, structjson)
	file_text_close(_file)
}

function load_saves() {
	create_save()
	
	var _file = file_text_open_read("save.sav")
	var _result = ""
	
	while !file_text_eof(_file) {
		_result += file_text_read_string(_file)
		file_text_readln(_file)
	}
	file_text_close(_file)
	
	var savestruct = json_parse(_result)
	
	if savestruct != undefined && is_struct(savestruct) {
		
		if struct_exists(savestruct, "player") && is_array(savestruct.player) {
			global.playerhead  = savestruct.player[0]
			global.playerbody  = savestruct.player[1]
			global.playerpants = savestruct.player[2]
		} else {
			global.playerhead  = 0
			global.playerbody  = 0
			global.playerpants = 0
		}

		global.maxfloor         = struct_get(savestruct, "maxfloor") ?? -1
		global.unlockedentities = struct_get(savestruct, "unlockedentities") ?? []

		var backstage_wrapper = struct_get(savestruct, "backstage") ?? undefined
		
		if backstage_wrapper != undefined {
			if is_struct(backstage_wrapper) && struct_exists(backstage_wrapper, "map") {
				global.backstage = backstage_wrapper.map
			} 
			else if is_array(backstage_wrapper) {
				global.backstage = backstage_wrapper 
			}
			else {
				global.backstage = []
			}
		} else {
			global.backstage = [] 
		}
		
		if is_array(global.backstage) && array_length(global.backstage) > 0 {
			global.backstagex = array_length(global.backstage[0]) div 2
			global.backstagey = array_length(global.backstage) div 2
		}
		
		global.time_capsule_item = -1
		var loaded_item = struct_get(savestruct, "time_capsule_item") ?? -1
		
		if is_struct(loaded_item) && struct_exists(loaded_item, "name") {
			var item_def = get_item_definition(loaded_item.name)
			
			if item_def != -1 {
				var new_item = variable_clone(item_def)
				
				if struct_exists(loaded_item, "dynamic") {
					new_item.dynamic = loaded_item.dynamic
				}
				
				global.time_capsule_item = new_item
			}
		}
		
	} else {
		global.playerhead = 0
		global.playerbody = 0
		global.playerpants = 0
		global.maxfloor = -1
		global.unlockedentities = []
		global.backstage = []
		global.time_capsule_item = -1 
	}
}

function save_entity_to_cafeteria(name) {
	if (!array_contains(global.unlockedentities, name)) {
		array_push(global.unlockedentities, name);
	}
	custom_save();
}

function createselectionpool(width, height) {
    var selection_pool = []; // Start with a clean, empty array
    
    // Correctly loop using the width and height numbers passed to the function
    for (var j = 0; j < height; j++) {
        for (var i = 0; i < width; i++) {
            array_push(selection_pool, [i, j]); // Push coordinate pairs
        }
    }
    
    return selection_pool;
}

function createbackstage(width, height) {
    var roomslist = [rm_backstage_basic,rm_backstage_basic_2];
    var mapgrid = array_create(height); 
    var datamapgrid = array_create(height);
    
    // Create mapgrid and datamapgrid cleanly
    for (var j = 0; j < height; j++) {
        mapgrid[j] = array_create(width); 
        datamapgrid[j] = array_create(width); 
        
        for (var i = 0; i < width; i++) {
            mapgrid[j][i] = roomslist[irandom(array_length(roomslist) - 1)];
            
            datamapgrid[j][i] = {
                islinked : false,
                haslink : false, // Added missing initialization
                linkedcoords : [-1, -1],
                darkroom : false
            };
        }
    }   
    
    // Generate the pool AFTER grids are fully instantiated
    var selection_pool = createselectionpool(width, height);
    selection_pool = array_shuffle(selection_pool);
    
    // Make darkrooms (Ensure we don't pop more than exists in pool)
    var darkroom_count = min(30, array_length(selection_pool));
    for (var i = 0; i < darkroom_count; i++) {
        var current_coord = array_pop(selection_pool);
        var target_x = current_coord[0];
        var target_y = current_coord[1];
    
        datamapgrid[target_y][target_x].darkroom = true;
    }
    
    // Regenerate selection pool for links to ensure fresh distribution
    selection_pool = createselectionpool(width, height);
    selection_pool = array_shuffle(selection_pool);
    
    // Make links (Requires 2 coordinates per iteration, so ensure we have at least 2 available)
    var link_count = min(10, array_length(selection_pool) div 2);
    for (var i = 0; i < link_count; i++) {
        var current_coord = array_pop(selection_pool);
        var target_x = current_coord[0];
        var target_y = current_coord[1];
        
        var end_coord = array_pop(selection_pool);
        var end_x = end_coord[0];
        var end_y = end_coord[1];       
    
        datamapgrid[target_y][target_x].haslink = true;
        datamapgrid[end_y][end_x].haslink = true;
        
        datamapgrid[target_y][target_x].linkedcoords = [end_x, end_y];
        datamapgrid[end_y][end_x].linkedcoords = [target_x, target_y];
    }   

    var middle_col = width div 2;
    var middle_row = height div 2;

    mapgrid[middle_row][middle_col] = rm_backstage_basic_intro;
    
    global.backstagex = middle_col;
    global.backstagey = middle_row;
    global.backstage  = mapgrid;
    global.backstagedata = datamapgrid;
}