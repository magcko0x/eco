if !DRAGGED {
	cursor = 1
		
	if CLICKED {
		obj_hand.grabbedobj = id	
	}
}

if DRAGGED {
	obj_hand.grabbedobj = id
	
	cursor = 9

	xspd = obj_hand.x - x
	yspd = obj_hand.y - y
} 
else if RELEASED {
	if (obj_hand.prevgrabbedobj == id) {
		obj_hand.grabbedobj = noone
	}
} 
else {
	xspd = lerp(xspd, 0, fric)
	yspd = lerp(yspd, 0, fric)
}

colliding = place_meeting(x + xspd, y, collisions) || place_meeting(x, y + yspd, collisions) || (!DRAGGED && instance_place(x + xspd, y + yspd, obj_ball) != noone)

if colliding != prevcollide {
	if obj_hand.grabbedobj = instance_id
		obj_hand.grabbedobj = noone
	audio_play_sound_at(snd_myxo_step,x,y,0,200,300,1,false,0,1,0,random_range(0.7,1.2))
}

if place_meeting(x + xspd, y, collisions) {

	var otherball = instance_place(x + xspd,y,obj_ball)

	if otherball != noone {
		otherball.xspd = xspd
	}
	
	
	xspd = -xspd * 0.5
}

if place_meeting(x, y + yspd, collisions) {

	var otherball = instance_place(x, y + yspd,obj_ball)

	if otherball != noone {
		otherball.yspd = yspd
	}
	
	yspd = -yspd * 0.5
}

var target = instance_place(x + xspd, y + yspd, obj_ball)

if (target != noone) {
	var dir = point_direction(target.x, target.y, x, y)
	var force = point_distance(0, 0, xspd, yspd) + 1
    
	xspd = lengthdir_x(force, dir) * 0.5
	yspd = lengthdir_y(force, dir) * 0.5

	target.xspd = lengthdir_x(force, dir + 180) * 0.5
	target.yspd = lengthdir_y(force, dir + 180) * 0.5
}


var entity = instance_place(x,y,movingentities)

if !DRAGGED && entity {
	var dir = point_direction(x,y,entity.x,entity.y)
	
	if entity.object_index != obj_player {
		if variable_instance_exists(entity,"spd") {
			xspd += lengthdir_x(entity.spd,dir + 180)
			yspd += lengthdir_y(entity.spd,dir + 180)
		}
	} else {
		if variable_instance_exists(entity,"spd") {
			xspd += lengthdir_x(entity.spd * abs(entity.xinput),dir + 180)
			yspd += lengthdir_y(entity.spd * abs(entity.yinput),dir + 180)
		}			
	}
	
}

var _travel_dist = point_distance(0, 0, xspd, yspd)

if (_travel_dist > 0.1) {

    var _spin_speed = _travel_dist * 0.5 
    
    image_angle -= (xspd + yspd) * (360 / (pi * sprite_width))
}

move_and_collide(xspd, yspd, collisions)

entity = instance_place(x,y,obj_ball)

if (entity != noone) {
var collidables = tag_get_asset_ids("solid", asset_object)

var my_type_index = array_get_index(collidables, object_index)
        
if (my_type_index != -1) {
	array_delete(collidables, my_type_index, 1)
}
var dir = point_direction(x, y, entity.x, entity.y)

	while (place_meeting(x, y, entity)) {
		var prev_x = entity.x
		var prev_y = entity.y

		var dx = lengthdir_x(1, dir)
		if (!place_meeting(entity.x + dx, entity.y, collidables)) {
			entity.x += dx
		}

		var dy = lengthdir_y(1, dir)
		if (!place_meeting(entity.x, entity.y + dy, collidables)) {
			entity.y += dy
		}
				
		if (entity.x == prev_x && entity.y == prev_y) break
		
		if (point_distance(x, y, entity.x, entity.y) > 128) break
	}
}
	
mylight.x = x
mylight.y = y

prevcollide = colliding