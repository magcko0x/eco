setdepth()

setdepth()

if global.interact {
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
		var _hspd = lengthdir_x(move_speed, dir)
		var _vspd = lengthdir_y(move_speed, dir)
	
		move_and_collide(_hspd, _vspd, collist)
	} else {
		var _normal = point_direction(0, 0, _nx, _ny)
	
		dir = _normal + 90

		var _hspd = lengthdir_x(move_speed, dir)
		var _vspd = lengthdir_y(move_speed, dir)
	
		var _glue_hspd = lengthdir_x(2, _normal - 180)
		var _glue_vspd = lengthdir_y(2, _normal - 180)
	
		move_and_collide(_hspd + _glue_hspd, _vspd + _glue_vspd, collist)
	}

	dir = (dir + 360) % 360

	var player = instance_place(x, y, obj_player)

	if player != noone {
		if player.myhand.state == player.myhand.free {
			with player {
				var _push_dir = point_direction(other.x, other.y, x, y)

				var _kb_x = lengthdir_x(32, _push_dir)
				var _kb_y = lengthdir_y(32, _push_dir)		
		
				move_and_collide(_kb_x, _kb_y, other.collist)
			
				myhand.state = myhand.disabled
			
				var flash = instance_create_depth(x, y, depth, obj_flash)
				flash.fade_color = c_red
			
				audio_play_sound(snd_punch, 0, false, 1, 0, random_range(0.8, 1.2))
			}
		}
	}
}