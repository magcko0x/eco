spd = 0

mylight = instance_create_depth(x,y,depth,obj_light)

mylight.radius = sprite_get_width(sprite_index)*image_xscale

timer = 0

for (var i = 1; i < length+1; i++) {
	mypart[i] = instance_create_depth(x,y,depth,obj_wormbody)
	
	if i = 1 {
		mypart[i].target = self
	} else {
		mypart[i].target = mypart[i-1]	
	}
	
	mypart[i].piece = i
	mypart[i].length = length
	mypart[i].head = self
	
	
	me = self
	
	with mypart[i] {
		image_xscale = (length - piece)/length
		image_yscale = (length - piece + 2)/length
	}
}

backx = 0
backy = 0

ipx = xstart
ipy = ystart