mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 32

cursor = 1
deac = false
returning = false

xspd = 0
yspd = 0

emitter = audio_emitter_create()
audio_emitter_falloff(emitter, 64, 96, 1)
alarm[0] = 2