#macro MAXEFFECTS 5
#macro EMPTYEFFECT [-1,-1,-1,-1]

var effectstruct = {
	index : -1,
	maxtime : -1,
	efftimer : -1,
	owner : noone
}

effects = array_create(MAXEFFECTS,-1)