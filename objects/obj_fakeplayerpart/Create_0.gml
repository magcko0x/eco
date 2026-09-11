randomise()

floory = y + irandom_range(32,96)

grav = 1

yspd = -irandom_range(10,20)

narray = [-1,1]

xdir = narray[irandom(1)]

xspd = irandom_range(10,20)

image_speed = 0

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 32
mylight.owner = self

crashsound = snd_A

image_alpha = 5

crashsoundplayed = false