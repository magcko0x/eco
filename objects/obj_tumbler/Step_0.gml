setdepth()

setdepth()

if global.interact {
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 
	
	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}
	
	spd = clamp(spd - slowdownspd,1,99999)
	
	audio_emitter_position(emitter, x, y, 0)

	var _check_dist = 6
	var _nx = 0
	var _ny = 0
	var _hit_wall = false

	for (var i = -45; i <= 135; i += 45) {
		var _check_dir = dir + i
		
		if place_meeting(x + lengthdir_x(_check_dist, _check_dir), y + lengthdir_y(_check_dist, _check_dir), collist) {
			_nx -= lengthdir_x(1, _check_dir) 
			_ny -= lengthdir_y(1, _check_dir)
			_hit_wall = true
		}
	}
	
	if _hit_wall && _nx == 0 && _ny == 0 {
		_nx -= lengthdir_x(1, dir + 90)
		_ny -= lengthdir_y(1, dir + 90)
	}

	if !_hit_wall {
		var _hspd = lengthdir_x(spd, dir)
		var _vspd = lengthdir_y(spd, dir)
	
		move_and_collide(_hspd, _vspd, collist)
	} else {
		var _normal = point_direction(0, 0, _nx, _ny)
	
		dir = _normal + 90

		var _hspd = lengthdir_x(spd, dir)
		var _vspd = lengthdir_y(spd, dir)
	
		var _glue_hspd = lengthdir_x(2, _normal - 180)
		var _glue_vspd = lengthdir_y(2, _normal - 180)
	
		move_and_collide(_hspd + _glue_hspd, _vspd + _glue_vspd, collist)
	}
	
	var tumbler_colliding = instance_place(x,y,obj_tumbler)
	
	if place_meeting(x,y,tumbler_colliding) {
		var _push_dir = point_direction(tumbler_colliding.x, tumbler_colliding.y, x, y)

		var _kb_x = lengthdir_x(32, _push_dir)
		var _kb_y = lengthdir_y(32, _push_dir)		
		
		move_and_collide(_kb_x, _kb_y, other.collist)		
	}

	dir = (dir + 360) % 360

	var player = instance_place(x, y, obj_player)

	if player != noone {
		if player.myhand.state == player.myhand.free && player.myhand.invincibletimer <= 0{
			with player {
				var _push_dir = point_direction(other.x, other.y, x, y)

				var _kb_x = lengthdir_x(32, _push_dir)
				var _kb_y = lengthdir_y(32, _push_dir)		
		
				move_and_collide(_kb_x, _kb_y, other.collist)
			
				myhand.state = myhand.disabled
				
			
				audio_play_sound(snd_hand_disable, 0, false)
			}
		}
	}
}