randomize()

if global.currentroom > -1 && global.currentroom < array_length(global.rooms)+1
	if array_contains(global.saferoomslist,global.rooms[global.currentroom])
		chance = irandom_range(0,3)
else
	chance = irandom_range(0,7)


mytendrils = -1

if chance = 0 {
	TA = (irandom_range(10,100) div 10)
	
	if instance_exists(obj_spawnzone) {
		for (var i = TA; i > 0; i--) {
			var zone = instance_find(obj_spawnzone,irandom(instance_number(obj_spawnzone) - 1))
			var me = self
		
			with zone {
				randomize()
				var mytendril = instance_create_depth((irandom_range(x,x+sprite_width) div 32) * 32,(irandom_range(y,y+sprite_height) div 32) * 32,depth,obj_tendril)
				me.mytendrils[clamp(array_length(me.mytendrils) - 1,0,9999)] = mytendril
			}
		}
	}
}
