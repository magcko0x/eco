spd = 0
maxspd = 4

var player = instance_nearest(x, y, obj_player)

ipx = player.x
ipy = player.y
ipd = point_direction(x, y, ipx, ipy)

farawaysfx = -1
closesfx = -1

was_on_screen = true
exit_edge = "none"