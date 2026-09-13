audio_listener_position(x,y,0)
audio_listener_orientation(x,y,1000,0,-1,0)
audio_listener_velocity(5,5,0)

dist = point_distance(x,y,obj_player.x,obj_player.y)

currentdist = clamp(dist / maxdist,0,1)

if global.interact {
	if active {
		state()
	}
}

if instance_exists(obj_lightsout) {
	color = make_colour_hsv(0,0,240 - obj_lightsout.darkness * 200)
} else color = c_white

if (currentdist < 1) && state = free {
	mylight.radius = clamp((32 / currentdist),0.1,128)
}
else {
	mylight.radius = 0
}

mylight.x = x
mylight.y = y

selectedobj = instance_place(x,y,tag_get_asset_ids("selectable",asset_object))

prevstate = state