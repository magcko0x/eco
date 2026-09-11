var me = id

if inputobj != noone {
	with inputobj {
		var wirecolor
		
		if variable_instance_exists(id,"charge") {
			wirecolor = merge_colour(c_black,c_aqua,charge/3)
		}
		
		draw_line_width_colour(x,y,me.x,me.y,3,wirecolor,wirecolor)
	}
}

if outputobj != noone {
	with outputobj {
		var wirecolor
		
		wirecolor = merge_colour(c_black,c_aqua,me.charge/3)
		
		draw_line_width_colour(x,y,me.x,me.y,3,wirecolor,wirecolor)
	}
}

draw_self()
draw_sprite(spr_powerbox_battery,charge,x,y)