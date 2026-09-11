if room = rm_death exit


for (var i = 0; i < MAXEFFECTS; i+= 1) {

	if effects[i] != -1 {
		var ind,maxt,t,owner,totalt
	
		ind = effects[i].index
		maxt = effects[i].maxtime
		t = effects[i].efftimer
        owner = effects[i].owner
	
		totalt = t/maxt
		
		if owner != noone {
			if effects[i] != -1 && i > 0{
				var effect = effects[i]
			
				if (effects[i-1] = -1) {
					owner.slot = i-1
					effects[i-1] = effect
					effects[i] = -1
				}
			}
		}
	}

}


for (var i = 0; i < MAXEFFECTS; i+= 1) {

	if effects[i] != -1 {
		var ind,maxt,t,totalt,owner
	
		ind = effects[i].index
		maxt = effects[i].maxtime
		t = effects[i].efftimer
		owner = effects[i].owner
	
		if t <= 0 || !instance_exists(owner){
			var effectstruct = {
				index : -1,
				maxtime : -1,
				time : -1,
				owner : noone
			}
			
			effects[i] = -1
		}
	
	}

}