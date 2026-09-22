setdepth()
var ipx, ipy, player;
player = instance_nearest(x,y,obj_player)
    
if instance_exists(mylight) {
    mylight.x = x
    mylight.y = y
}

if state = "FREE" {
    ipx = player.x + offx
    ipy = player.y + offy

    if spd < 2
    	spd += 0.25
}

if state = "DEFEAT" {
    
    maxshakestrength = 0

    ipx = xx
    ipy = yy
    
    
    if spd < 8
    	spd += 0.25   
}

if state = "FREE" {
    if point_distance(x,y,ipx,ipy) <= 32 * 4 {
        
        maxshakestrength = 6
        
    	audio_stop_sound(farawaysfx)
        
    	if !audio_is_playing(snd_meowwake) {
    		closesfx = audio_play_sound_at(snd_meowwake,x,y,0,600,900,1,false,0,1,0,random_range(1,1.5))
        }
        
    	image_index = 1
    } else {
        
        maxshakestrength = 2
        
        audio_stop_sound(closesfx)
        		
    	if !audio_is_playing(farawaysfx) {
    		farawaysfx = audio_play_sound_at(snd_meowwake,x,y,0,600,900,1,false,0,1,0,random_range(0.25,0.5))
        }
        
    	image_index = 0
    }
}

if state = "DEFEAT" {
    instance_destroy(mypointer)
    image_index = defframe
}

if global.interact {
    if state = "FREE" {
    	if CLICKED {
    		state = "DEFEAT"
    		audio_stop_sound(closesfx)
    		audio_stop_sound(farawaysfx)
            audio_play_sound(snd_punch,0,false,1,0,random_range(0.7,1.2))
    		instance_create_depth(x,y,-10000,obj_flash)
			alarm[0] = 30
    	}
    	
    	var xdiff = ipx-x;
    	var ydiff = ipy-y;
    	var dir = point_direction(x,y,ipx,ipy);
    	var dist = point_distance(x,y,ipx,ipy);
        
        x += lengthdir_x(min(spd,abs(xdiff)),dir);
        y += lengthdir_y(min(spd,abs(ydiff)),dir);
   
 
		var colsize = 16
		
		var collision =
		rectangle_in_rectangle(
			x - colsize, y - colsize, x + colsize, y + colsize,
			player.bbox_left,player.bbox_top,player.bbox_right,player.bbox_bottom
		)

    	if collision {
    		if player.state != player.dead {
    			global.diedto = "meow"
    			player.state = player.dead
    		}
    	}
    }
    
    if state = "DEFEAT" {
    	deac = true
    }
}