xspd = irandom_range(-2,2)
yspd = irandom_range(-2,2)
zspd = irandom_range(-30,-10)
grav = 1
z = -5


layer_create(depth,"Particles")
psystem[0] = part_system_create_layer("Particles",false);