depth = 5000

if !customcolor image_blend = c_yellow

cursor = 1

shake_strength = 0

if lock {
	sprite_index = spr_lockblocklock
	deac = false
} else deac = true

state = "free"

prevstate = state

drawyscale = 1

opensfx = snd_dooropen
closesfx = snd_lockdoor