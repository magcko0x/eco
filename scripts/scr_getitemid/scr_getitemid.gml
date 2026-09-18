function check_handlers(itemid) {
    
    var idd = noone
    
	if !instance_exists(obj_item_handler) {
		return idd
	} else {
        
        for (var i = 0; i < instance_number(obj_item_handler); i++) {
			if instance_find(obj_item_handler,i).idd = itemid {
				idd = instance_find(obj_item_handler,i) 
			}
		}
        
        return idd
	}
}

global.itemlist = [
	{
		name : "Battery",
		sprite : spr_item_battery,
		image : 0,
		cost : 10,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				var handler = check_handlers(0)
				
				if handler == noone {
					var myhandler = instance_create_depth(obj_hand.x, obj_hand.y, 0, obj_item_handler)
					myhandler.timer = 800
					myhandler.aftereffectimer = 10
					myhandler.idd = 0
					
					with myhandler {
						var effectstruct = {
							index : 0,
							efftimer : timer,
							maxtime : timer,
							owner : id
						}
						
						var emptystruct = {
							index : -1,
							efftimer : -1,
							maxtime : -1,
							owner : noone
						}
						
						slot = inventory_add(obj_effect_drawer.effects, effectstruct)[1]
						
						itemcode = function() {
							if slot != -1 && is_struct(obj_effect_drawer.effects[slot])
								obj_effect_drawer.effects[slot].efftimer = timer
							
							if global.interact
								timer--
							
							if timer > -1
								obj_player.addspd = 5
							
							if timer <= -1 {
								obj_player.addspd = 0
								instance_destroy()
							}
							
							if obj_player.moving {
								aftereffectimer--
								
								if aftereffectimer == 0 {
									with obj_player {
										var effect = instance_create_depth(x, y, 0, obj_aftereffect)
										effect.owner = self
									}
									aftereffectimer = 10
								}
							}
						}
						
						inventory_remove(_inventory, _slot)
					}
				} else {
					handler.timer = 800
					inventory_remove(_inventory, _slot)
				}
			}
		}
	},
	
	{
		name : "Compass",
		sprite : spr_item_compass,
		image : 0,
		cost : 5,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				var handler = check_handlers(1)
				
				if handler == noone {
					var myhandler = instance_create_depth(obj_hand.x, obj_hand.y, 0, obj_item_handler)
					myhandler.counter = 4
					myhandler.idd = 1
					
					with myhandler {
						var effectstruct = {
							index : 1,
							efftimer : counter,
							maxtime : counter,
							owner : id
						}
						
						slot = inventory_add(obj_effect_drawer.effects, effectstruct)[1]
						
						itemcode = function() {
							if slot != -1 && is_struct(obj_effect_drawer.effects[slot])
								obj_effect_drawer.effects[slot].efftimer = counter
							
							if counter == 0
								instance_destroy()
						}
					}
					
					myhandler.ipol = [
						obj_key,
						obj_syringe
					]
					
					with myhandler {
						for (var i = 0; i < array_length(ipol); i++) {
							for (var j = 0; j < instance_number(ipol[i]); j++) {
								var myarrow = instance_create_depth(x, y, 0, obj_arrow)
								myarrow.interest_point = instance_find(ipol[i], j)
							}
						}
						
						roomstartcode = function() {
							counter--
							alarm[0] = 10
						}
						
						alarmcode0 = function() {
							for (var i = 0; i < array_length(ipol); i++) {
								for (var j = 0; j < instance_number(ipol[i]); j++) {
									var myarrow = instance_create_depth(x, y, 0, obj_arrow)
									myarrow.interest_point = instance_find(ipol[i], j)
								}
							}
						}
					}
					
					inventory_remove(_inventory, _slot)
				} else {
					handler.counter = 4
					inventory_remove(_inventory, _slot)
				}
			}
		}
	},
	
	{
		name : "Apple",
		sprite : spr_item_apple,
		image : 0,
		cost : 50,		
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				randomise()
				
				if instance_exists(obj_rottimer) {
					with obj_rottimer {
						shake_strength = 6
						timer += irandom_range(-(MINUTE / 2), MINUTE / 2.5)
						timer = clamp(timer,0,MINUTE * (99 + 59/60))						
					}
				}
				
				inventory_remove(_inventory, _slot)
			}
		}
	},
{
		name : "SAVE",
		sprite : spr_item_save,
		image : 0,
		cost : 100,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				
				if !(room == rm_elevator || room == rm_lobby_elevator || global.floor == -1) {
					ini_open("tempsave")
					
					//room
					ini_write_real("room", "currentroom", global.currentroom)
					
					//playerpos
					ini_write_real("player", "x", obj_player.x)
					ini_write_real("player", "y", obj_player.y)
					
					//inventory
					for (var i = 0; i < INVENTORY_SLOTS; i++) {
						var item = obj_playerhandler.playerinventory[i]
						
						if is_struct(item) {
							// Save the base name
							ini_write_string("inventory", "slot_name" + string(i), item.name)
							
							// Save the dynamic struct as a string if it exists
							if variable_struct_exists(item, "dynamic") {
								ini_write_string("inventory", "slot_dyn" + string(i), json_stringify(item.dynamic))
							} else {
								ini_write_string("inventory", "slot_dyn" + string(i), "")
							}
						} else {
							// Empty slot
							ini_write_string("inventory", "slot_name" + string(i), "")
							ini_write_string("inventory", "slot_dyn" + string(i), "")
						}
					}
					
					//entities
					if instance_exists(obj_rothandler)
						ini_write_real("entities", "rottimer", obj_rottimer.timer)
					
					if instance_exists(obj_bunhandler) {
						ini_write_real("entities", "buntimer", obj_bunhandler.bun_spawn_timer)
						ini_write_real("entities", "bunspawn", obj_bunhandler.bun_spawn_active)
						ini_write_real("entities", "bunactive", obj_bunhandler.bun_active)
						ini_write_real("entities", "bunstillhere", obj_bunhandler.still_here)
					}
					
					if instance_exists(obj_shihandler)
						ini_write_real("entities", "shiactive", obj_shihandler.active)
					
					if instance_exists(obj_mothervirushandler)
						ini_write_real("entities", "virusesactive", obj_mothervirushandler.active)
					
					if !instance_exists(obj_virushandler)
						ini_write_real("entities", "virushandlerexists", false)
					
					//misc
					ini_write_real("misc", "musicposition", audio_sound_get_track_position(global.pmusic))
					ini_write_real("misc", "credits",global.credits)
					
					ini_close()
					
					if instance_exists(obj_saveloadtext)
						instance_destroy(obj_saveloadtext)
					
					var mytext = instance_create_depth(0, 0, 0, obj_saveloadtext)
					mytext.type = 0
					
					_inventory[_slot] = variable_clone(get_item_definition("LOAD"))
					
				} else {
					_inventory[_slot] = variable_clone(get_item_definition("CORRUPTED FILE"))
					mouse_clear(mb_right)
				}
			}
		}
	},
	
	{
		name : "LOAD",
		sprite : spr_item_load,
		image : 0,
		cost : 100,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				
				if !(room == rm_elevator || room == rm_lobby_elevator || global.floor == -1) {
					ini_open("tempsave")
					
					//room
					global.currentroom = ini_read_real("room", "currentroom", global.currentroom)
					room = global.rooms[global.currentroom]
					
					//playerpos
					obj_player.x = ini_read_real("player", "x", obj_player.x)
					obj_player.y = ini_read_real("player", "y", obj_player.y)
					
					//inventory
					for (var i = 0; i < INVENTORY_SLOTS; i++) {
						var item_name = ini_read_string("inventory", "slot_name" + string(i), "")
						
						if item_name != "" {
							var item_def = get_item_definition(item_name)
							
							if item_def != -1 {
								var new_item = variable_clone(item_def)
								
								// Read and parse the dynamic string back into a struct
								var dyn_str = ini_read_string("inventory", "slot_dyn" + string(i), "")
								if dyn_str != ""
									new_item.dynamic = json_parse(dyn_str)
									
								obj_playerhandler.playerinventory[i] = new_item
							} else {
								obj_playerhandler.playerinventory[i] = -1
							}
						} else {
							obj_playerhandler.playerinventory[i] = -1
						}
					}
					
					//entities
					if instance_exists(obj_rothandler)
						obj_rottimer.timer = ini_read_real("entities", "rottimer", obj_rottimer.timer)
					
					if instance_exists(obj_bunhandler) {
						obj_bunhandler.bun_spawn_timer = ini_read_real("entities", "buntimer", obj_bunhandler.bun_spawn_timer)
						obj_bunhandler.bun_spawn_active = ini_read_real("entities", "bunspawn", obj_bunhandler.bun_spawn_active)
						obj_bunhandler.bun_active = ini_read_real("entities", "bunactive", obj_bunhandler.bun_active)
						obj_bunhandler.still_here = ini_read_real("entities", "bunstillhere", obj_bunhandler.still_here)
					}
					
					if instance_exists(obj_shihandler)
						obj_shihandler.active = ini_read_real("entities", "shiactive", obj_shihandler.active)
					
					if instance_exists(obj_mothervirushandler)
						obj_mothervirushandler.active = ini_read_real("entities", "virusesactive", obj_mothervirushandler.active)
					
					if instance_exists(obj_virushandler) {
						if ini_read_real("entities", "virushandlerexists", false) == true
							instance_destroy(obj_virushandler)
					}
					
					//misc
					audio_sound_set_track_position(global.pmusic, ini_read_real("misc", "musicposition", audio_sound_get_track_position(global.music)))
					
					global.credits = ini_read_real("misc", "credits",global.credits)					
					
					ini_close()
					file_delete("tempsave")
					
					if instance_exists(obj_saveloadtext)
						instance_destroy(obj_saveloadtext)
					
					var mytext = instance_create_depth(0, 0, 0, obj_saveloadtext)
					mytext.type = 1
					
					inventory_remove(_inventory, _slot)
					
				} else {
					_inventory[_slot] = variable_clone(get_item_definition("CORRUPTED FILE"))
					mouse_clear(mb_right)
				}
			}
		}
	},
	
	{
		name : "CORRUPTED FILE",
		sprite : spr_item_corrupted_save,
		image : 0,
		cost : 100,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				if instance_exists(obj_saveloadtext)
					instance_destroy(obj_saveloadtext)
				
				var mytext = instance_create_depth(0, 0, 0, obj_saveloadtext)
				mytext.type = 2
				
				inventory_remove(_inventory, _slot)
			}
		}
	},
	
	{
		name : "GREEN SUN",
		sprite : spr_item_green_sun,
		image : 0,
		cost : 250,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				if room != rm_elevator && room != rm_lobby_elevator && global.floor != -1 {
					if !instance_exists(obj_transition) {
						var tran = instance_create_depth(0, 0, -8000, obj_transition)
						var goto = clamp(global.currentroom + 10, 0, array_length(global.rooms) - 1)
						global.currentroom = goto
						target_rm = global.rooms[goto]
						tran.usetarget = true
						tran.enID = 0
						tran.roomgoto = 0
						tran.fade_color = c_green
						tran.target_rm = target_rm
						inventory_remove(_inventory, _slot)
					}
				} else {
					if !instance_exists(obj_transition) {
						var tran = instance_create_depth(0, 0, -8000, obj_transition)
						tran.usetarget = true
						tran.enID = 0
						tran.roomgoto = 1
						tran.fade_color = c_green
						inventory_remove(_inventory, _slot)
					}
				}
			}
		}
	},
	
	{
		name : "BLOSSOM",
		sprite : spr_item_blossom,
		image : 0,
		cost : 500,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				var handler = check_handlers(7)
				var spawnsounds = [snd_blossom_spawn1, snd_blossom_spawn2, snd_blossom_spawn3]
				
				if handler == noone {
					var myhandler = instance_create_depth(0, 0, 0, obj_item_handler)
					myhandler.blossomcount = 1
					
					with myhandler {
						var myblossom = instance_create_depth(-32, -32, 0, obj_blossom)
						myblossom.owner = self
						
						roomstartcode = function() {
							for (var i = 0; i < blossomcount; i++) {
								var myblossom = instance_create_depth(-32, -32, 0, obj_blossom)
								myblossom.owner = self
							}
						}
						
						inventory_remove(_inventory, _slot)
					}
				} else {
					handler.blossomcount += 1
					inventory_remove(_inventory, _slot)
				}
				
				audio_play_sound(spawnsounds[irandom(2)], 0, false, random_range(1, 1.2), 0, random_range(1, 1.2))
			}
		}
	},
	
	{
		name : "FINDER",
		sprite : spr_item_finder,
		image : 0,
		update_function : function(_inventory, _slot, _selected_slot) {
		},
		use_function : function(_inventory, _slot) {
			if global.interact {
				if global.inbackstage {
					if !layer_get_visible("menu_backstagemap") {
						audio_play_sound(snd_lever, 0, false, 1, 0, random_range(0.4, 0.6))
						global.canpause = false
						obj_player.active = false
						obj_hand.active = false
						global.hideinventory = true
						layer_set_visible("menu_backstagemap", true)
					}
				}
			}
		}
	}
]