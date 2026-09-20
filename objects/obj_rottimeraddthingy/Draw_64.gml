var xx = 480
var finaly = -32

var is_negative = (timer < 0)
var abs_timer = abs(timer)

var secs, mins, disp
disp = abs_timer div 60

secs = string_replace(string_format(disp mod 60,2,0)," ","0")
mins = string_replace(string_format(disp div 60,2,0)," ","0")

var d1,d2,d3,d4

d1 = real(string_char_at(secs,1))
d2 = real(string_char_at(secs,2))
d3 = real(string_char_at(mins,1))
d4 = real(string_char_at(mins,2))


var c = is_negative ? c_red : c_lime
var dsign = is_negative ? 12 : 11

if timer != 0 {
	draw_sprite_ext(spr_rottimernumber,dsign,xx - 36,ypos,1,1,0,c,1)
}
draw_sprite_ext(spr_rottimernumber,d3,xx - 24,ypos,1,1,0,c,1)
draw_sprite_ext(spr_rottimernumber,d4,xx - 12,ypos,1,1,0,c,1)
draw_sprite_ext(spr_rottimernumber,10,xx,ypos,1,1,0,c,1)
draw_sprite_ext(spr_rottimernumber,d1,xx + 12,ypos,1,1,0,c,1)
draw_sprite_ext(spr_rottimernumber,d2,xx + 24,ypos,1,1,0,c,1)


ypos = lerp(ypos,finaly,0.05)

if point_distance(0,ypos,0,finaly) <= 0.5 {
	instance_destroy()
}
