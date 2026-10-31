

draw_rectangle_colour(0,0,display_get_gui_width(),display_get_gui_height(),#007F00,#007F00,#004C00,#004C00,false)

draw_rectangle_colour(0,display_get_gui_height() - 160,display_get_gui_width(),display_get_gui_height(),c_orange,c_orange,#7F4500,#7F4500,false)

draw_set_colour(c_white)
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_set_font(fnt_UI)

draw_text(display_get_gui_width()/2,0,"MENU IS IN BETA AND IS SUBJECT TO CHANGE")

draw_set_halign(fa_left)
draw_set_valign(fa_top)

head = variable_clone(get_item_definition(global.playerhead, "index", global.headslist))
body = variable_clone(get_item_definition(global.playerbody, "index", global.bodieslist))
pants = variable_clone(get_item_definition(global.playerpants, "index", global.pantslist))

var screen_width = display_get_gui_width()
var screen_height = display_get_gui_height()

var _mouse_x = device_mouse_x_to_gui(0), _mouse_y = device_mouse_y_to_gui(0)

var cursor = 0 

var _parts = [headslist, bodieslist, pantslist]
var _menu = _parts[selectedmenu]
var _item_width = crop * scale

draw_set_colour(#7F4500)
draw_rectangle(0,screen_height - 24 * scale,screen_width,screen_height,false)

draw_set_colour(#7F4500)
draw_rectangle(0,screen_height - 32 * scale,screen_width,screen_height - 24 * scale,false)

var _total_width = array_length(_menu) * _item_width
var _max_scroll = max(0, _total_width - screen_width)
var _thumb_width = screen_width * clamp(screen_width / _total_width, 0, 1)
var _scroll_pct = (_max_scroll > 0) ? (-clothesbarx / _max_scroll) : 0
var _thumb_x = _scroll_pct * (screen_width - _thumb_width)

draw_set_colour(c_orange)
draw_rectangle(_thumb_x, screen_height - 32 * scale, _thumb_x + _thumb_width, screen_height - 24 * scale, false)
draw_set_colour(#F8BF7C)
draw_rectangle(_thumb_x, screen_height - 32 * scale, _thumb_x + _thumb_width, screen_height - 31 * scale, false)
draw_set_colour(#CC5B16)
draw_rectangle(_thumb_x, screen_height - 25 * scale, _thumb_x + _thumb_width, screen_height - 24 * scale, false)
draw_set_colour(c_white)


if point_in_rectangle(_mouse_x,_mouse_y,0,screen_height - 32 * scale,screen_width,screen_height - 24 * scale) && _max_scroll != 0 {
	cursor = 1
	
	if mouse_check_button(mb_left) {
		scrollbargrabbed = true
	}
	
	if mouse_wheel_up() {
		clothesbarx += _item_width/2
	}
	
	if mouse_wheel_down() {
		clothesbarx -= _item_width/2
	}
}

if !mouse_check_button(mb_left) && scrollbargrabbed {
	scrollbargrabbed = false	
}

if scrollbargrabbed {
	cursor = 9
	clothesbarx = -(_max_scroll * clamp(_mouse_x / screen_width, 0, 1))	
}

clothesbarx = clamp(clothesbarx, -_max_scroll, 0)

for (var i = 0; i < array_length(_menu); i++) {
	
	var _xx = clothesbarx + (_item_width * i)
	
	if (_xx + _item_width < 0) {
		continue
	}
	
	if (_xx > screen_width) {
		break
	}
	
	var a = 1
	var c = c_black
	var unlocked = true //TODO: change back to false later bb
	
	var unlockedlists = [unlockedheads,unlockedbodies,unlockedpants]
	
	if array_contains(unlockedlists[selectedmenu],_menu[i].index) {
		unlocked = true
	}
	
	if unlocked {
		c = c_white
		
		if point_in_rectangle(_mouse_x,_mouse_y,_xx + 1,clothesbary + 1,_xx + _item_width - 1,clothesbary + _item_width - 1) {
			cursor = 1
		
			a = 0.5
		
			if mouse_check_button_pressed(mb_left) {
			
				audio_play_sound(springsfx[irandom(array_length(springsfx)-1)],0,false,1,0,random_range(0.7,1.2))
			
				if selectedmenu == 0 {
					global.playerhead = headslist[i].index
					headsize = 1
				}
			
				if selectedmenu == 1 {
					global.playerbody = bodieslist[i].index
					bodysize = 1
				}
			
				if selectedmenu == 2 {
					global.playerpants = pantslist[i].index	
					pantssize = 1
				}
			
				custom_save()
			}
		}
	}
	
	draw_sprite_part_ext(_menu[i].front_sprite, 0, 0, 0, crop, crop, _xx, clothesbary, scale, scale, c, a)
	
	if !unlocked {
		draw_sprite_ext(spr_character_lock,0,_xx, clothesbary, scale, scale, 0, c_white, 1)
	}
}

draw_set_colour(c_orange)
draw_rectangle(0,screen_height - 24 * scale,screen_width,screen_height - 20 * scale,false)
draw_rectangle(0,screen_height - 2 * scale,screen_width,screen_height,false)
draw_set_colour(c_white)

var _exit_hovered = point_in_rectangle(_mouse_x,_mouse_y,16,16,48,48)

if _exit_hovered {
	
	if mouse_check_button_pressed(mb_left) {
		mouse_clear(mb_left)
		menu_exit()
	}
	
	cursor = 1
}

draw_sprite(spr_exitbutton,_exit_hovered,16,16)

for (var i = 0; i < 3; i++) {
	
	var x1 = display_get_gui_width()-48
	var y1 = i * 34 + 16
	var x2 = display_get_gui_width()-17
	var y2 = i * 34 + 16 + 31
	
	var hover_over_button = point_in_rectangle(_mouse_x,_mouse_y,x1,y1,x2,y2)
	
	if hover_over_button {
		draw_set_colour(c_white)
		draw_rectangle(x1 - 1,y1 - 1,x2 + 1,y2 + 1,false)
		cursor = 1
		
		if mouse_check_button_pressed(mb_left) {
			
			audio_play_sound(springsfx[irandom(array_length(springsfx)-1)],0,false,1,0,random_range(0.7,1.2))
			
			if i = 0 {
				headsize = 1	
			}
			else if i = 1 {
				bodysize = 1	
			}
			else if i = 2 {
				pantssize = 1	
			}
			
			selectedmenu = i		
			
		}
	}
	
	draw_sprite_ext(spr_clothesbuttonsGUI,i,display_get_gui_width() - 48,i * 34 + 16,2,2,0,c_white,1)
}

if head != -1 && body != -1 && pants != -1 {

	var currentpantssprite = ydir = -1 ? pants.back_sprite : pants.front_sprite

	var currentbodysprite = ydir = -1 ? body.back_sprite : body.front_sprite

	var currentheadsprite = ydir = -1 ? head.back_sprite : head.front_sprite

	var frequency,amplitude

	frequency = 0.02
	amplitude = 1.5

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

	var pantsy = player_drawer_y - (sprite_get_yoffset(currentpantssprite) * size) - (bob * size) + (pantsyoffset * size)

	var bodyy = pantsy + (sprite_get_yoffset(currentbodysprite) * size) - (sprite_get_height(currentbodysprite) * size) + (2 * size) + (bodyyoffset * size)

	var body_top = bodyy - (sprite_get_yoffset(currentbodysprite) * size)

	var heady = body_top + (sprite_get_yoffset(currentheadsprite) * size) - (sprite_get_height(currentheadsprite) * size) / 1.25 + (yoff * size) + (bob * 2 * size) + (headyoffset * size)
	
	headsize = lerp(headsize,0,0.1)
	bodysize = lerp(bodysize,0,0.1)
	pantssize = lerp(pantssize,0,0.1)
	
	if ydir = -1 {
		draw_sprite_ext(currentheadsprite,get_current_part_frame(currentheadsprite),player_drawer_x - (8 * xdir * size) + headxoffset * xdir * size,heady,-xdir * size,size - clamp((yoff/32) * size,0,9999),angleoff * xdir,c_white,1)
		draw_sprite_ext(currentpantssprite,get_current_part_frame(currentpantssprite) * moving,player_drawer_x + pantsxoffset * xdir * size,pantsy,xdir * size,size,0,c_white,1)
		draw_sprite_ext(currentbodysprite,get_current_part_frame(currentbodysprite),player_drawer_x + bodyxoffset * xdir * size,bodyy,xdir * size,size,angleoff * xdir,c_white,1)
	}

	if ydir = 1 {
		if selected == 3 {
			draw_outline(currentpantssprite,get_current_part_frame(currentpantssprite) * moving,1,c_white,player_drawer_x + pantsxoffset * xdir * (size + pantssize),pantsy,xdir * (size + pantssize),size + pantssize,0)
		}
		draw_sprite_ext(currentpantssprite,get_current_part_frame(currentpantssprite) * moving,player_drawer_x + pantsxoffset * xdir * (size + pantssize),pantsy,xdir * (size + pantssize),size + pantssize,0,c_white,1)
		
		if selected == 2{
			draw_outline(currentbodysprite,get_current_part_frame(currentbodysprite),1,c_white,player_drawer_x + bodyxoffset * xdir * (size + bodysize),bodyy,xdir * (size + bodysize),size + bodysize,angleoff * xdir)	
		}		
		draw_sprite_ext(currentbodysprite,get_current_part_frame(currentbodysprite),player_drawer_x + bodyxoffset * xdir * (size + bodysize),bodyy,xdir * (size + bodysize),size + bodysize,angleoff * xdir,c_white,1)
		
		if selected == 1{
			draw_outline(currentheadsprite,get_current_part_frame(currentheadsprite),1,c_white,player_drawer_x - (8 * xdir * size) + headxoffset * xdir * (size + headsize),heady,xdir * (size + headsize),(size + headsize) - clamp((yoff/32) * (size + headsize),0,9999),angleoff * xdir)	
		}
		
		draw_sprite_ext(currentheadsprite,get_current_part_frame(currentheadsprite),player_drawer_x - (8 * xdir * size) + headxoffset * xdir * (size + headsize),heady,xdir * (size + headsize),(size + headsize) - clamp((yoff/32) * (size + headsize),0,9999),angleoff * xdir,c_white,1)
	}
	
	var _pants_w = sprite_get_width(currentpantssprite) * (size + pantssize)
	var _pants_h = sprite_get_height(currentpantssprite) * (size + pantssize)
	var _pants_xo = sprite_get_xoffset(currentpantssprite) * (size + pantssize)
	var _pants_yo = sprite_get_yoffset(currentpantssprite) * (size + pantssize)
	var _pants_base_x = player_drawer_x + pantsxoffset * xdir * (size + pantssize)

	var _body_w = sprite_get_width(currentbodysprite) * (size + bodysize)
	var _body_h = sprite_get_height(currentbodysprite) * (size + bodysize)
	var _body_xo = sprite_get_xoffset(currentbodysprite) * (size + bodysize)
	var _body_yo = sprite_get_yoffset(currentbodysprite) * (size + bodysize)
	var _body_base_x = player_drawer_x + bodyxoffset * xdir * (size + bodysize)

	var _head_base_x = player_drawer_x + (-8 * xdir + headxoffset * xdir) * (size + headsize)
	var _head_w = sprite_get_width(currentheadsprite) * (size + headsize)
	var _head_scale_y = size - clamp((yoff / 32) * (size + headsize), 0, 9999)
	var _head_h = sprite_get_height(currentheadsprite) * _head_scale_y
	var _head_xo = sprite_get_xoffset(currentheadsprite) * (size + headsize)
	var _head_yo = sprite_get_yoffset(currentheadsprite) * _head_scale_y

	var _head_scale_x = xdir * (size + headsize)
	if ydir = -1 {
		_head_scale_x = -xdir * (size + headsize)
	}

	var _pants_x1, _pants_y1, _pants_x2, _pants_y2
	if xdir >= 0 {
		_pants_x1 = _pants_base_x - _pants_xo
		_pants_x2 = _pants_x1 + _pants_w
	} else {
		_pants_x1 = _pants_base_x - (_pants_w - _pants_xo)
		_pants_x2 = _pants_x1 + _pants_w
	}
	_pants_y1 = pantsy - _pants_yo
	_pants_y2 = _pants_y1 + _pants_h

	var _body_x1, _body_y1, _body_x2, _body_y2
	if xdir >= 0 {
		_body_x1 = _body_base_x - _body_xo
		_body_x2 = _body_x1 + _body_w
	} else {
		_body_x1 = _body_base_x - (_body_w - _body_xo)
		_body_x2 = _body_x1 + _body_w
	}
	_body_y1 = bodyy - _body_yo
	_body_y2 = _body_y1 + _body_h

	var _head_x1, _head_y1, _head_x2, _head_y2
	if _head_scale_x >= 0 {
		_head_x1 = _head_base_x - _head_xo
		_head_x2 = _head_x1 + _head_w
	} else {
		_head_x1 = _head_base_x - (_head_w - _head_xo)
		_head_x2 = _head_x1 + _head_w
	}
	_head_y1 = heady - _head_yo
	_head_y2 = _head_y1 + _head_h

	//draw toast
	//head, body and pants
	selected = 0
	
	if !scrollbargrabbed {
		if point_in_rectangle(_mouse_x,_mouse_y,_head_x1,_head_y1,_head_x2,_head_y2) {
		
			cursor = 1
		
			draw_toast(_mouse_x,_mouse_y,head.name,head.desc)
		
			selected = 1
		
			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(springsfx[irandom(array_length(springsfx)-1)],0,false,1,0,random_range(0.7,1.2))
				headsize = 1
				selectedmenu = 0	
			}
	
		} else if point_in_rectangle(_mouse_x,_mouse_y,_body_x1,_body_y1,_body_x2,_body_y2) {
		
			cursor = 1
		
			draw_toast(_mouse_x,_mouse_y,body.name,body.desc)
	
			selected = 2

			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(springsfx[irandom(array_length(springsfx)-1)],0,false,1,0,random_range(0.7,1.2))
				bodysize = 1
				selectedmenu = 1
			}
	

		} else if point_in_rectangle(_mouse_x,_mouse_y,_pants_x1,_pants_y1,_pants_x2,_pants_y2) {
		
			cursor = 1
		
			draw_toast(_mouse_x,_mouse_y,pants.name,pants.desc)
		
			selected = 3
		
			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(springsfx[irandom(array_length(springsfx)-1)],0,false,1,0,random_range(0.7,1.2))
				pantssize = 1
				selectedmenu = 2
			}
			
		}
	}
	
	draw_set_colour(c_white)


} else {
	draw_self()	
}



//draw mouse
draw_sprite_ext(spr_hand,cursor,_mouse_x,_mouse_y,1,1,0,c_white,1)
