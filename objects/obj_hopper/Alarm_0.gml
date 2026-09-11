zspd = -irandom_range(10,20)
spd = clamp(point_distance(x,y,target.x,target.y) / -(zspd * 4),4,10) * facing
dir = point_direction(x,y,target.x,target.y) * facing