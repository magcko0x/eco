setdepth()

var frequency,amplitude

frequency = 0.012
amplitude = 5

timer += frequency;

var y_offset = sin(timer) * amplitude;

var angle_offset = cos(timer) * amplitude

itemy = y_offset

itema = y_offset + angle_offset

if array_length(itemarray) > 0 {
	selector = clamp(selector,0,array_length(itemarray) - 1)

	item = itemarray[selector]
	
}