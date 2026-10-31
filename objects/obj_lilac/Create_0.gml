maxtime = 150
timer = maxtime
radius = 200
max_shake_strength_x = 0
shake_x = 0
shake_y = 0
angry = false
hspd = 0
vspd = 0
accel = 0.02
emitter = audio_emitter_create()
audio_emitter_falloff(emitter, 480, 640, 1)
current_sound = -1
emitter_vol = 0
alarm[0] = 2
mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 64