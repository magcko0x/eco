timer = 0


menu_exit = function() {
	var tran = instance_create_depth(0,0,0,obj_transition)
	
	tran.extraparams = true
	tran.skipfade = true
	tran.usetarget = false
	tran.target_rm = global.prevroom
	tran.target_x = global.prevplayerroomx
	tran.target_y = global.prevplayerroomy		
	global.canpause = true
	keyboard_clear(vk_escape)
}

get_current_part_frame = function(sprite) {
	
	var total_steps = floor((current_time / 1000) * sprite_get_speed(sprite))
	return total_steps % sprite_get_number(sprite)
}

draw_toast = function(_x,_y,name,desc) {
	draw_set_font(fnt_courier_italic)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)	
	
	var _margin = 6
	var _title_w = string_width(name)
	var _title_h = string_height(name)
	var _desc_w = string_width_ext(desc,16,256) * 0.8
	var _desc_h = string_height_ext(desc,16,256) * 0.8
	var _box_w = max(_title_w, _desc_w) + (_margin * 2)
	var _box_h = _title_h + 4 + _desc_h + (_margin * 2)
	var _box_x = _x + 8
	var _box_y = _y + 8
	draw_sprite_ext(spr_clothesdescGUI,0,_box_x,_box_y,_box_w / sprite_get_width(spr_clothesdescGUI),_box_h / sprite_get_height(spr_clothesdescGUI),0,c_white,1)
	draw_set_colour(c_white)
	draw_text_ext_transformed(_box_x + _margin, _box_y + _margin,name,16,256,1,1,0)
	draw_set_colour(c_gray)
	draw_text_ext_transformed(_box_x + _margin,_box_y + _margin + _title_h + 4,desc,16,256,0.8,0.8,0)
	
	draw_set_font(fnt_courier)
}

xdir = -1
ydir = 1
size = 3

selected = 0
selectedmenu = 0

moving = false

global.canpause = false

unlockedclothes = global.unlockedclothes

unlockedheads = array_create(0)
unlockedbodies = array_create(0)
unlockedpants = array_create(0)


headslist = global.headslist
bodieslist = global.bodieslist
pantslist = global.pantslist
scrollbargrabbed = false

for (var i = 0; i < array_length(unlockedclothes); i++) {
	var wear = get_item_definition(unlockedclothes[i],"index", [global.headslist,global.bodieslist,global.pantslist],true)
	
	if wear != -1 {
		if wear.list == global.headslist {
			array_push(unlockedheads,wear.name)	
		} else if wear.list == global.bodieslist {
			array_push(unlockedbodies,wear.name)	
		} else if wear.list == global.pantslist {
			array_push(unlockedpants,wear.name)	
		}
	}

}

var screen_width = display_get_gui_width()
var screen_height = display_get_gui_height()

player_drawer_x = screen_width / 2
player_drawer_y = screen_height - 160

crop = 16
scale = 3

clothesbarx = 4 * scale
clothesbary = screen_height - crop * scale - 8

headsize = 0
bodysize = 0
pantssize = 0

springsfx = [snd_goofysring_1,snd_goofysring_2,snd_goofysring_3,snd_goofysring_4]