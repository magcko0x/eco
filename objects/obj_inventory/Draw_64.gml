if !global.hideinventory {
	
	if instance_exists(obj_playerhandler) {
    
		//Draw window
    
		draw_sprite_stretched(spr_invmenu,0,invx,invy,12+row_length*36,12+(((INVENTORY_SLOTS-1) div row_length)+1)*36)
    
		//Draw items

		for (var i = 0; i < INVENTORY_SLOTS; i+= 1) {
			var xx = 6 + (i mod row_length) * (32 + 4) + 2 + invx;
			var yy = 6 + (i div row_length) * (32 + 4) + 2 + invy;
	
			draw_sprite(spr_slot,0,xx,yy)
			if pos = i {draw_sprite(spr_cursor,0,xx,yy)}	
	
			if (obj_playerhandler.playerinventory[i] != -1) {
				
				var itemsprite = obj_playerhandler.playerinventory[i].sprite
				var itemimage = obj_playerhandler.playerinventory[i].image
				var itemxoff = sprite_get_xoffset(itemsprite)
				var itemyoff = sprite_get_yoffset(itemsprite)
				
				draw_sprite(itemsprite,itemimage,xx + itemxoff,yy + itemyoff)
			}
		}
    
	    //Draw name
    
		var textdisplays = tag_get_asset_ids("textdisplay",asset_object)
		var textdisplay = noone
	
		for (var i = 0; i < array_length(textdisplays); i++)
			if instance_exists(textdisplays[i]) {
				textdisplay = instance_find(textdisplays[i],0)	
				break
			}
	
	    if (pos != prevpos || obj_playerhandler.playerinventory[pos] != previtem) && obj_playerhandler.playerinventory[pos] != -1{
	        namealpha = 3
	    }
    
	    if namealpha > 0
	        namealpha -= 0.05
    
	    draw_set_halign(fa_center)
	    draw_set_valign(fa_bottom)
	    draw_set_font(fnt_UI)
	
		var addy = 0
		var addy2 = 0
	
		if textdisplay != noone {
			if string_char_at(textdisplay.textpart,string_length(textdisplay.textpart)) != "" {
				addy = textdisplay.stringheight + 10
			} else {
				addy = 26 + 15	
			}
		}
	
		if instance_exists(obj_rottimer) {
			addy2 = 36 + obj_rottimer.shakey
		}
	
	    draw_text_ext_transformed_colour(480,invy - 5 - addy - addy2,string_upper(obj_playerhandler.playerinventory[pos].name),32,16,0.5,0.5,0,c_white,c_white,c_white,c_white,namealpha)
    
	    //Draw keys
    
	    if obj_playerhandler.key {
	        keyshakex = irandom_range(-keyshake_strength,keyshake_strength)
	        keyshakey = irandom_range(-keyshake_strength,keyshake_strength)
        
	        if keyshake_strength > 0
	        	keyshake_strength -= 0.5
        
			keycolor = obj_playerhandler.keycolor
		
	        draw_sprite_ext(spr_keyGUI, 0, keyshakex + keyinvx, keyshakey + keyinvy,1,1,0,keycolor,1)
	    }
    
		//Draw credits
		
		if showcredits {
			var credits = "C" + string_replace_all(string_format(currentcredits,3,0)," ","0")
		
			if currentcredits != global.credits {
				var prev_credits = floor(currentcredits)
	
				currentcredits = lerp(currentcredits, global.credits, 0.1)
	
				if abs(global.credits - currentcredits) < 0.5 {
					currentcredits = global.credits
				}
	
				if floor(currentcredits) != prev_credits {
					audio_play_sound(snd_credit, 0, false, 0.5, 0, 2)
				}
			}
		
			draw_set_font(myfont)
		    draw_set_halign(fa_left)
		    draw_set_valign(fa_top)
		
			var creditsw = 96
			var creditsh = string_height(credits)
		
			var creditsyoffset = 8
			var creditsxoffset = -16
		
			draw_sprite_stretched
			(
				spr_credit_counter,
				0,
				invx - creditsw - 8 + creditsxoffset,invy - 8 + creditsyoffset,
				creditsw + 12,32 + 16
			)
				
			draw_text_colour(invx - creditsw + creditsxoffset,invy + creditsyoffset,credits,c_white,c_white,c_white,c_white,1)
	
		    prevpos = pos
		    previtem = obj_playerhandler.playerinventory[pos]
		}
	}
}