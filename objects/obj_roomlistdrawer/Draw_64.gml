//Draw rooms

for (var i = 0; i < array_length(global.rooms)-1; i++) {
	var icon = 0
	var xx = 6 + (i mod row_length) * (16) + 2;
	var yy = 6 + (i div row_length) * (16) + 2;
	
	draw_sprite(spr_roomiconslot,0,xx,yy)
	
	if array_contains(global.basicroomslist,global.rooms[i])
		icon = 0
	if array_contains(global.keyroomslist,global.rooms[i])
		icon = 1
	if array_contains(global.saferoomslist,global.rooms[i])
		icon = 2
	if array_contains(global.importantroomslist,global.rooms[i])
		icon = 3
	
	draw_sprite(spr_roomicons,icon,xx,yy)
	
	if global.currentroom = i {
		draw_sprite(spr_roomiconslot,1,xx,yy)
	}
}