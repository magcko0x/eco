setdepth()

dist = point_distance(owner.owner.x, owner.owner.y,owner.x + owner.shakex,owner.y + owner.shakey)
dir = point_direction(owner.owner.x, owner.owner.y,owner.x + owner.shakex,owner.y + owner.shakey)

x = owner.owner.x
y =	owner.owner.y

image_speed = 0.5 * owner.currentdist

image_blend = merge_color(c_white,c_red,owner.currentdist)

image_xscale = dist / sprite_get_width(sprite_index)
image_angle = dir