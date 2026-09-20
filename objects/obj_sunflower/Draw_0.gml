if instance_exists(mytalker) {
	
	var latestchar = string_char_at(mytalker.textpart,string_length(mytalker.textpart))

	if mytalker.charcount < string_length(mytalker.filtered_text) && !(latestchar = "." || latestchar = ","){
		angleadd += mouthframe	
	}
}

for (var j = 1; j > -1; j--)
	for (var i = 0; i < petalamount; i++) {
		if i % 2 = j {
			var angle = (360/petalamount) * i + angleadd
	
			var addx,addy
	
			if i % 2 = 1 {
				addx = lengthdir_x(5, angle + 90);
				addy = lengthdir_y(5, angle + 90);
			} else {
				addx = 0
				addy = 0
			}
	
			draw_sprite_ext(spr_sunnypetal,0,x+addx,y+addy,1,1,angle,c_white,1)
		}
	}

if !deac
	draw_selected(spr_sunnyhead,0)
draw_sprite(spr_sunnyhead,0,x,y)

for (var i = -1; i < 2; i++) {
	
	if i != 0 {
		
		var targetobj = obj_hand
		
		var basepupilx = x + 16 * i
		var basepupily = y - 8
		
		var maxpupildistx = 5
		var maxpupildisty = 3
		
		var pupilangle = point_direction(basepupilx, basepupily, targetobj.x, targetobj.y)
		var pupildist = point_distance(basepupilx, basepupily, targetobj.x, targetobj.y)
		
		var pupildistx = clamp(pupildist, 0, maxpupildistx);
		var pupildisty = clamp(pupildist,0,maxpupildisty)
		
		var xx = basepupilx + lengthdir_x(pupildistx, pupilangle);
		var yy = basepupily + lengthdir_y(pupildisty, pupilangle);
		
		
		var flip
		
		if i = 1 {
			flip = -1
		} else {
			flip = 1	
		}
		draw_sprite_ext(eyesprite,0,x + 16 * i,y - 8,flip,1,0,c_white,1)
		draw_sprite(eyesprite,1,xx,yy)
	}
		
}

if instance_exists(mytalker) {
	var letter = string_upper(string_char_at(mytalker.textpart,string_length(mytalker.textpart)))

	for (var i = 0; i < array_length(mouthgroup); i++) {
		for (var j = 0; j < array_length(mouthgroup[i]);j++) {
			if letter = mouthgroup[i][j] {
				startmouthframe = i	
			}
		}
	}
	
} else {
	startmouthframe = 2
}

if prevstartframe != startmouthframe {
	framecount = 0
	mouthframe = startmouthframe	
}

prevstartframe = startmouthframe

endmouthframe = startmouthframe + 4

if framecount < 1
	framecount += 0.25

if framecount = 1 {
	mouthframe = endmouthframe	
}

draw_sprite(mouthsprite,mouthframe,x,y+8)