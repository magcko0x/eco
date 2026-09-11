setdepth()

ipx = obj_player.x
ipy = obj_player.y

timer += 0.05 * spd

var xdiff = ipx-x;
var ydiff = ipy-y;
var dir = point_direction(x,y,ipx,ipy);
var dist = point_distance(x,y,ipx,ipy);

direction = dir

image_angle = direction - 90 + sin(timer) * 15

if dist > 64 {
	if spd < 5 {
		spd += 0.1
	}
} else if spd > 0 {
	spd -= 0.1
}

if spd < 0
	spd = 0

mylight.x = x
mylight.y = y

x += lengthdir_x(min(spd,abs(xdiff)),dir);
y += lengthdir_y(min(spd,abs(ydiff)),dir);

var orbit_angle = point_direction(x,y,ipx,ipy) + 180 + sin(timer) * 30
	
var orbit_dist = point_distance(x,y,ipx,ipy)
var orbit_maxdist = (sprite_get_width(sprite_index)*image_xscale)/3
	
var currentdist = clamp((orbit_dist/orbit_maxdist),1,1)

backx = x + lengthdir_x(orbit_maxdist, orbit_angle) * currentdist
backy = y + lengthdir_y(orbit_maxdist, orbit_angle) * currentdist

if place_meeting(x,y,obj_player) {
	global.diedto = "worm"
	
	if obj_player.state != obj_player.dead {
		obj_player.state = obj_player.dead	
	}
}