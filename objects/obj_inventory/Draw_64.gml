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
				draw_sprite(spr_item,obj_playerhandler.playerinventory[i],xx,yy)
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
	
	    draw_text_ext_transformed_colour(480,invy - 5 - addy - addy2,string_upper(name),32,16,0.5,0.5,0,c_white,c_white,c_white,c_white,namealpha)
    
	    //Draw keys
    
	    if obj_playerhandler.key {
	        keyshakex = irandom_range(-keyshake_strength,keyshake_strength)
	        keyshakey = irandom_range(-keyshake_strength,keyshake_strength)
        
	        if keyshake_strength > 0
	        	keyshake_strength -= 0.5
        
			keycolor = obj_playerhandler.keycolor
		
	        draw_sprite_ext(spr_keyGUI, 0, keyshakex + keyinvx, keyshakey + keyinvy,1,1,0,keycolor,1)
	    }
    
	    prevpos = pos
	    previtem = obj_playerhandler.playerinventory[pos]
	}
}