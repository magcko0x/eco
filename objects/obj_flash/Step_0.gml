if doroutine = true {
	if current_alpha > 0 {
		current_alpha -= alpha_larper	
	}

	if current_alpha <= 0 {
		instance_destroy()
	}
}