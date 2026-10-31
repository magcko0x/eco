head = variable_clone(get_item_definition(global.playerhead,"index",global.headslist))
body = variable_clone(get_item_definition(global.playerbody,"index",global.bodieslist))
pants = variable_clone(get_item_definition(global.playerpants,"index",global.pantslist))

if head != -1 && body != -1 && pants != -1 {

	var currentpantssprite = ydir = -1 ? pants.back_sprite : pants.front_sprite

	var currentbodysprite = ydir = -1 ? body.back_sprite : body.front_sprite

	var currentheadsprite = ydir = -1 ? head.back_sprite : head.front_sprite

	if moving {
	
		var target_frame = (sprite_get_number(currentpantssprite) / 2) - 1
		var current_frame = get_current_part_frame(currentpantssprite) % (sprite_get_number(currentpantssprite) + 1)
	
		if current_frame == target_frame {
			if canstep = true {
				audio_play_sound_at(snd_step,x,y,0,300,600,1,false,0,1,0,random_range(1,2))
				canstep = false
			}
		} else {
			canstep = true	
		}
		
	} else {
		canstep = true	
	}

	var frequency,amplitude
	if moving {
	    frequency = 0.12 * spd / 2
	    amplitude = 3
	} else {
	    frequency = 0.02
	    amplitude = 1.5
	}

	timer += frequency;

	var y_offset = sin(timer) * amplitude;

	var angle_offset = cos(timer) * amplitude * xdir

	yoff = y_offset

	angleoff = y_offset + angle_offset

	var bob = ( get_current_part_frame(currentpantssprite) mod 2 ) * 2 * moving

	var pantsyoffset = 0
	var bodyyoffset = 0
	var headyoffset = 0

	var pantsxoffset = 0
	var bodyxoffset = 0
	var headxoffset = 0

	if struct_exists(pants,"y_off") {
		pantsyoffset = pants.y_off
	}

	if struct_exists(body,"y_off") {
		bodyyoffset = body.y_off	
	}

	if struct_exists(head,"y_off") {
		headyoffset = head.y_off		
	}

	if struct_exists(pants,"x_off") {
		pantsxoffset = pants.x_off
	}

	if struct_exists(body,"x_off") {
		bodyxoffset = body.x_off	
	}

	if struct_exists(head,"x_off") {
		headxoffset = head.x_off		
	}



	var pantsy = y - sprite_get_yoffset(currentpantssprite) - bob + pantsyoffset

	var bodyy = pantsy + sprite_get_yoffset(currentbodysprite) - sprite_get_height(currentbodysprite) + 2 + bodyyoffset

	var body_top = bodyy - sprite_get_yoffset(currentbodysprite)

	var heady = body_top + sprite_get_yoffset(currentheadsprite) - sprite_get_height(currentheadsprite) / 1.25 +  yoff + (bob * 2) + headyoffset

	if ydir = -1 {
		draw_sprite_ext(currentheadsprite,get_current_part_frame(currentheadsprite),x - 8 * xdir +  headxoffset * xdir,heady,-xdir,1 - clamp(yoff/32,0,9999),angleoff * xdir,c_white,1)
		draw_sprite_ext(currentpantssprite,get_current_part_frame(currentpantssprite) * moving,x + pantsxoffset * xdir,pantsy,xdir,1,0,c_white,1)
		draw_sprite_ext(currentbodysprite,get_current_part_frame(currentbodysprite),x + bodyxoffset * xdir,bodyy,xdir,1,angleoff * xdir,c_white,1)
	}

	if ydir = 1 {
		draw_sprite_ext(currentpantssprite,get_current_part_frame(currentpantssprite) * moving,x + pantsxoffset * xdir,pantsy,xdir,1,0,c_white,1)
		draw_sprite_ext(currentbodysprite,get_current_part_frame(currentbodysprite),x + bodyxoffset * xdir,bodyy,xdir,1,angleoff * xdir,c_white,1)
		draw_sprite_ext(currentheadsprite,get_current_part_frame(currentheadsprite),x - 8 * xdir +  headxoffset * xdir,heady,xdir,1 - clamp(yoff/32,0,9999),angleoff * xdir,c_white,1)
	}
} else {
	draw_self()	
}