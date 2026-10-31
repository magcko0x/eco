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
			player: ["head_camera", "body_basic", "pants_basic"],
			unlockedclothes: ["head_camera", "body_basic", "pants_basic"],
			unlockedfloors: ["floor_industry"],
			beatenfloors: [],
			unlockedentities: [],
			time_capsule_item: -1,
			tokens : 0,
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
		unlockedclothes: global.unlockedclothes,
		unlockedfloors: global.unlockedfloors,
		beatenfloors: global.beatenfloors,
		unlockedentities: global.unlockedentities,
		time_capsule_item: _saved_item,
		tokens : global.tokens
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
			global.playerhead = savestruct.player[0]
			global.playerbody = savestruct.player[1]
			global.playerpants = savestruct.player[2]
		} else {
			global.playerhead = "head_camera"
			global.playerbody = "body_basic"
			global.playerpants = "pants_basic"
		}
		
		if struct_exists(savestruct, "unlockedclothes") {
			global.unlockedclothes = savestruct.unlockedclothes
		} else {
			global.unlockedclothes = ["head_camera", "body_basic", "pants_basic"]	
		}
		
		global.tokens = struct_get(savestruct,"tokens") ?? 0
		global.unlockedfloors = struct_get(savestruct, "unlockedfloors") ?? ["floor_industry"]
		global.beatenfloors = struct_get(savestruct, "beatenfloors") ?? [] 
		global.unlockedentities = struct_get(savestruct, "unlockedentities") ?? []

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
		global.playerhead = "head_camera"
		global.playerbody = "body_basic"
		global.playerpants = "pants_basic"
		global.unlockedclothes = ["head_camera", "body_basic", "pants_basic"]
		global.maxfloor = -1
		global.unlockedentities = []
		global.time_capsule_item = -1
		global.unlockedfloors = ["floor_industry"]
		global.beatenfloors = []
		global.tokens = 0
	}
}

function save_entity_to_cafeteria(name) {
	if (!array_contains(global.unlockedentities, name)) {
		array_push(global.unlockedentities, name)
		var notif = instance_create_depth(0,0,-9000,obj_notification)
		
		var capitalized_name = string_upper(string_copy(name,1,1)) + string_lower(string_copy(name,2,string_length(name)))
		
		notif.notiftext = capitalized_name + " has joined the cafeteria!"
		
		var requestedicon = asset_get_index("spr_"+name+"_icon")
		
		if requestedicon != -1
			notif.notificon = requestedicon
	}
	custom_save()
}

function save_entities_based_on_floors() {
	
	var entity_pool = [
		["rot", "bun", "tendril", "shi", "myxo"],
		["meow", "tumbler", "tim", "hopper","lilac"]
	]
	
	var floor_pool = ["floor_industry", "floor_floating_plateau"]
	
	for (var j = 0; j < array_length(floor_pool); j++) {
		if array_contains(global.beatenfloors, floor_pool[j]) {	
			for (var i = 0; i < array_length(entity_pool[j]); i++) {
				if !array_contains(global.unlockedentities, entity_pool[j][i]) {
					array_push(global.unlockedentities, entity_pool[j][i])

					var name = entity_pool[j][i]
					
					var notif = instance_create_depth(0, 0, -9000, obj_notification)
		
					var capitalized_name = string_upper(string_copy(name, 1, 1)) + string_lower(string_copy(name, 2, string_length(name)))
		
					notif.notiftext = capitalized_name + " has joined the cafeteria!"
					
					notif.time_created += i
		
					var requestedicon = asset_get_index("spr_" + name + "_icon")
		
					if requestedicon != -1
						notif.notificon = requestedicon					
				}
			}
		}
	}
	
	custom_save()
}
