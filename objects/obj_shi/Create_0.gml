owner = noone

frame = 0

fakespd = 0

aftereffectimer = 10

spd = 15

flapcounter = 0 

shake_strength = 4

timer = 100

my_path = path_add();

add = 0

mycrosshair = instance_create_depth(x,y,-9000,obj_crosshair)

mycrosshair.owner = self

mychain = instance_create_depth(x,y,depth + 1,obj_chainline)

mychain.owner = self

mychain.target = mycrosshair

mychain.sprite_index = spr_chargearrow

flapsnd = -1
chargesnd = -1

circling = function() {
	if audio_exists(chargesnd)
		audio_stop_sound(chargesnd)
	
	image_speed = 0.25
	
	add++
	
	x = x + cos(add/10) * 4
	y = y + sin(add/10) * 4
	
	timer--
	
	if timer > 25 {
		targetx = obj_player.x
		targety = obj_player.y
	}
	
	if timer = 0 {
		instance_destroy(mycrosshair)
		state = charge
	}
}

charge = function() {
	
	image_speed = 2

	image_angle = point_direction(x,y,targetx,targety) - 90
	
	if !audio_is_playing(chargesnd)
		chargesnd = audio_play_sound_at(snd_shi_charge,x,y,0,200,400,1,false,0,1,0)
	
	var distance = point_distance(x, y, targetx, targety);
	
	aftereffectimer--
	
	if aftereffectimer = 0 {
		var effect = instance_create_depth(x,y,depth,obj_aftereffect)
		effect.owner = self
		aftereffectimer = 10
	}
	
	
	if (distance <= 10)
	{
		mycrosshair = instance_create_depth(x,y,-9000,obj_crosshair)
		mycrosshair.owner = self
		mychain.target = mycrosshair
		timer = 100
		add = 0
		image_angle = 0
		state = circling
	}
	else
	{
		var xdiff = targetx-x;
		var ydiff = targety-y;
		var dir = point_direction(x,y,targetx,targety);
		var dist = point_distance(x,y,targetx,targety);
		x += lengthdir_x(min(spd,abs(xdiff)),dir);
		y += lengthdir_y(min(spd,abs(ydiff)),dir);
	}
}

state = circling

save_entity_to_cafeteria("shi")