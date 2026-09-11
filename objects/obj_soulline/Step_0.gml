setdepth()

dist = point_distance(owner.x + owner.shakex,owner.y + owner.shakey, owner.owner.x, owner.owner.y)
dir = point_direction(owner.x + owner.shakex,owner.y + owner.shakey, owner.owner.x, owner.owner.y)

x = owner.x
y =	owner.y

image_speed = 0.5 * owner.currentdist

image_blend = merge_color(c_white,c_red,owner.currentdist)

image_xscale = dist / sprite_get_width(sprite_index)
image_angle = dir