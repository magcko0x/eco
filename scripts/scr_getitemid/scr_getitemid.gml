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


function getitemstuff(_id,_inventory,_slot) {
	#macro USE mouse_check_button_pressed(mb_right) && obj_hand.state = obj_hand.free && pos = _slot
    #macro UPDATE flip[_slot] != pflip[_slot]
	
	switch _id {
		case 0:
			name = "Battery"
            
			if global.interact {
                
                if USE {
                    
                    var handler = check_handlers(0)
                    
					if handler = noone {
						var myhandler = instance_create_depth(obj_hand.x,obj_hand.y,depth,obj_item_handler)
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
							
							slot = inventory_add(obj_effect_drawer.effects,effectstruct)[1]
							
							
							itemcode = function() {
								if slot != -1
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
	
									if aftereffectimer = 0 {
										with obj_player {
											var effect = instance_create_depth(x,y,depth,obj_aftereffect)
											effect.owner = self
										}
										aftereffectimer = 10
									}
								}
							
							}
				
							inventory_remove(_inventory,_slot)
						}
					} else {
                        handler.timer = 800
                        inventory_remove(_inventory,_slot)
                    }
				}
			}
		break;
		
		case 1:
			name = "Compass"

			if global.interact {
				if USE {
                    var handler = check_handlers(1)
                    
					if handler = noone {
						
						var myhandler = instance_create_depth(obj_hand.x,obj_hand.y,depth,obj_item_handler)
						myhandler.counter = 4
						myhandler.idd = 1
					
						with myhandler {
							var effectstruct = {
								index : 1,
								efftimer : counter,
								maxtime : counter,
								owner : id
							}							
							
							slot = inventory_add(obj_effect_drawer.effects,effectstruct)[1]
							
							itemcode = function() {
								
								if slot != -1
									obj_effect_drawer.effects[slot].efftimer = counter
								
								if counter == 0{
									instance_destroy()
								}
							}
						}
					
						myhandler.ipol = [
							obj_key,
							obj_syringe,
						]
					
						with myhandler {
	
							for (var i = 0; i < array_length(ipol); i++) {
								for (var j = 0; j < instance_number(ipol[i]); j++) {
									var myarrow = instance_create_depth(x,y,depth,obj_arrow)
									myarrow.interest_point = instance_find(ipol[i],j)
								}
							}
						
							roomstartcode = function() {
                                counter--
								alarm[0] = 10
							}
						
							alarmcode0 = function() {
								for (var i = 0; i < array_length(ipol); i++) {
									for (var j = 0; j < instance_number(ipol[i]); j++) {
										var myarrow = instance_create_depth(x,y,depth,obj_arrow)
										myarrow.interest_point = instance_find(ipol[i],j)
									}
								}
							}
						
						}
					
						inventory_remove(_inventory,_slot)
					} else {
                        handler.counter = 4
                        inventory_remove(_inventory,_slot)
                    }
				}
			}
		break;
		
		case 2:
			name = "Apple"

			if global.interact {
				if USE {
				
					randomise()
				
					if instance_exists(obj_rottimer) {
						with obj_rottimer {
							shake_strength = 6
							timer += irandom_range(-(MINUTE/2),MINUTE*2)
						}
					}
				
					inventory_remove(_inventory,_slot)
				}
			}
		break;
    
		case 3:
			name = "SAVE"

			if global.interact {
                if UPDATE {
                    
                    if !variable_instance_exists(id,"ft") {
                        ft = array_create(INVENTORY_SLOTS,2)
                        fs = array_create(INVENTORY_SLOTS,false)
                    }
                    
                    if fs[_slot] {
                        ft[_slot]--
                    }
                    
                    if ft[_slot] = 0 {
                        fs[_slot] = false
                        ft[_slot] = 2
                        
                        ini_open("tempsave")
                        
                        //room
                        ini_write_real("room","currentroom",global.currentroom)
                        
                        //playerpos
                        ini_write_real("player","x",obj_player.x)
                        ini_write_real("player","y",obj_player.y)
                        
                        //inventory
                        for (var i = 0; i < INVENTORY_SLOTS; i++) {
                             ini_write_real("inventory","slot" + string(i),obj_playerhandler.playerinventory[i])
                        }
                        
                        //entities
                        if instance_exists(obj_rothandler) {
                            ini_write_real("entities","rottimer",obj_rottimer.timer)
                        }
                        
                        if instance_exists(obj_bunhandler) {
                            ini_write_real("entities","buntimer",obj_bunhandler.bun_spawn_timer)
                            ini_write_real("entities","bunspawn",obj_bunhandler.bun_spawn_active)
                            ini_write_real("entities","bunactive",obj_bunhandler.bun_active)
                            ini_write_real("entities","bunstillhere",obj_bunhandler.still_here)
                        }
                        
						if instance_exists(obj_shihandler) {
							ini_write_real("entities","shiactive",obj_shihandler.active) 
						}
						
						if instance_exists(obj_mothervirushandler) {
							ini_write_real("entities","virusesactive",obj_mothervirushandler.active)	
						}
						
						if !instance_exists(obj_virushandler) {
							ini_write_real("entities","virushandlerexists",false)	
						}
						
                        //misc
                        ini_write_real("misc","musicposition",audio_sound_get_track_position(global.pmusic))
                        
                        
                        ini_close()
                        
                        
                        if instance_exists(obj_saveloadtext) {
                            instance_destroy(obj_saveloadtext)
                        }
                        
                        var mytext = instance_create_depth(0,0,depth,obj_saveloadtext)
                        mytext.type = 0
                        
                        _inventory[_slot] = 4
                    }
                }
                
				if USE {
					if !(room = rm_elevator || room = rm_lobby_elevator || global.floor = -1) {
						fs[_slot] = true
					} else {
						_inventory[_slot] = 5
						mouse_clear(mb_right)
					}
				}
			}
		break;
    
		case 4:
			name = "LOAD"

			if global.interact {
				if USE {
					if !(room = rm_elevator || room = rm_lobby_elevator || global.floor = -1) {
	                    ini_open("tempsave")
                    
	                    //room
	                    global.currentroom = ini_read_real("room","currentroom",global.currentroom)
	                    room = global.rooms[global.currentroom]
                    
	                    //playerpos
	                    obj_player.x = ini_read_real("player","x",obj_player.x)
	                    obj_player.y = ini_read_real("player","y",obj_player.y)
                    
	                    //inventory
	                    for (var i = 0; i < INVENTORY_SLOTS; i++) {
	                        obj_playerhandler.playerinventory[i] = ini_read_real("inventory","slot" + string(i),obj_playerhandler.playerinventory[i])
	                    }
                       
	                    //entities
	                    if instance_exists(obj_rothandler) { 
	                        obj_rottimer.timer = ini_read_real("entities","rottimer",obj_rottimer.timer)
	                    }
                    
	                    if instance_exists(obj_bunhandler) {
	                        obj_bunhandler.bun_spawn_timer = ini_read_real("entities","buntimer",obj_bunhandler.bun_spawn_timer)
	                        obj_bunhandler.bun_spawn_active = ini_read_real("entities","bunspawn",obj_bunhandler.bun_spawn_active)
	                        obj_bunhandler.bun_active = ini_read_real("entities","bunactive",obj_bunhandler.bun_active)
	                        obj_bunhandler.still_here = ini_read_real("entities","bunstillhere",obj_bunhandler.still_here)
	                    }
						
						if instance_exists(obj_shihandler) {
							obj_shihandler.active = ini_read_real("entities","shiactive",obj_shihandler.active) 
						}
						
						if instance_exists(obj_mothervirushandler) {
							obj_mothervirushandler.active = ini_read_real("entities","virusesactive",obj_mothervirushandler.active)
						}						
						
						if instance_exists(obj_virushandler) {
							if ini_read_real("entities","virushandlerexists",false) = true
								instance_destroy(obj_virushandler)	
						}
						
	                    //misc
	                    audio_sound_set_track_position(global.pmusic,ini_read_real("misc","musicposition",audio_sound_get_track_position(global.music)))
                    
	                    ini_close()
                    
	                    file_delete("tempsave")
                    
                    
                    
	                    if instance_exists(obj_saveloadtext) {
	                        instance_destroy(obj_saveloadtext)
	                    }
                        
	                    var mytext = instance_create_depth(0,0,depth,obj_saveloadtext)
	                    mytext.type = 1
                    
						inventory_remove(_inventory,_slot)
					} else {
						_inventory[_slot] = 5
						mouse_clear(mb_right)
					}
				}
			}
		break;
    
		case 5:
			name = "CORRUPTED FILE"

			if global.interact {
				if USE {
                    
                    if instance_exists(obj_saveloadtext) {
                        instance_destroy(obj_saveloadtext)
                    }
                        
                    var mytext = instance_create_depth(0,0,depth,obj_saveloadtext)
                    mytext.type = 2
                    
					inventory_remove(_inventory,_slot)
				}
			}
		break; 
	
		case 6:
			name = "GREEN SUN"

			if global.interact {
				if USE {			
					
					if room != rm_elevator && room != rm_lobby_elevator && global.floor != -1 {
						if !instance_exists(obj_transition) {
							var tran = instance_create_depth(0,0,-8000,obj_transition)
							var goto = clamp(global.currentroom + 10,0,array_length(global.rooms)-1)
							global.currentroom = goto
							target_rm = global.rooms[goto]
							tran.usetarget = true
							tran.enID = 0
							tran.roomgoto = 0
							tran.fade_color = c_green
							tran.target_rm = target_rm
							inventory_remove(_inventory,_slot)
						}
					} else {
						if !instance_exists(obj_transition) {
							var tran = instance_create_depth(0,0,-8000,obj_transition)
							tran.usetarget = true
							tran.enID = 0
							tran.roomgoto = 1
							tran.fade_color = c_green
							inventory_remove(_inventory,_slot)
						}
					}
				}
			}		
		break;
		
		case 7:
			name = "BLOSSOM"
            
			if global.interact {
                
                if USE {
					
                    var handler = check_handlers(7)		
					
					var spawnsounds = [snd_blossom_spawn1,snd_blossom_spawn2,snd_blossom_spawn3]
					
					if handler = noone {
						var myhandler = instance_create_depth(0,0,depth,obj_item_handler)
						myhandler.blossomcount = 1
								
						with myhandler {
							
							var myblossom = instance_create_depth(-32,-32,depth,obj_blossom)
					
							myblossom.owner = self
							
							roomstartcode = function() {
								for (var i = 0; i < blossomcount; i++) {
									var myblossom = instance_create_depth(-32,-32,depth,obj_blossom)
									myblossom.owner = self
								}
							}
				
							inventory_remove(_inventory,_slot)
						}
					} else {
                        handler.blossomcount += 1
                        inventory_remove(_inventory,_slot)
                    }
					
					audio_play_sound(spawnsounds[irandom(2)],0,false,random_range(1,1.2),0,random_range(1,1.2))
					
				}
			}
		
		break;
		
		case 8:
			name = "FINDER"
            
			if global.interact {
                
                if USE {
					if global.inbackstage {
						if !layer_get_visible("menu_backstagemap") {
							audio_play_sound(snd_lever,0,false,1,0,random_range(0.4,0.6))
							global.canpause = false
							obj_player.active = false
							obj_hand.active = false
							global.hideinventory = true
							layer_set_visible("menu_backstagemap",true)
						}
					}
				}
				
			}
			
		break;
	}
	
	return []
}