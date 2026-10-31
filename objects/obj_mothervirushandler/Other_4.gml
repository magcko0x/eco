alarm[0] = 5

if !active {
	chancer = irandom_range(0,75)

	if chancer = 0 {
		viruses = [availableviruses[irandom(array_length(availableviruses)-1)]]	
		active = true
	}
}