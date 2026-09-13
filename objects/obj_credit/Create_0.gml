event_inherited()

depth = 5000

bannedcol = [
	!obj_spawnzone,
	obj_tendril,
	obj_collision,
	obj_syringe
]

cursor = 1

creditdeflist = [
		[{sprite : spr_credit1, cost : 1},3000],
		[{sprite : spr_credit2, cost : 5},500],
		[{sprite : spr_credit3, cost : 20},50],
        [{sprite : spr_credit4, cost : 100},1],
]

creditdef = weighted_random(creditdeflist)

amount = creditdef.cost
sprite_index = creditdef.sprite

image_angle = random_range(-45,45)

image_speed = random_range(0.9,1.2)