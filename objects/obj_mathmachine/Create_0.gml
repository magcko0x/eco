randomize()

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = 64

function get_random_expression(num) {
    var _is_addition = choose(true, false);
	var _expression = {
		value_1 : 0,
		value_2 : 0,
		addition : true
	}

    if (_is_addition) {

        var _val1 = irandom_range(0, num); 

        var _min_val2 = 0
        var _max_val2 = num - _val1;
        
        var _val2 = irandom_range(_min_val2, _max_val2);
        
        _expression =
			{
				value_1 : _val1,
				value_2 : _val2,
				addition : _is_addition,
			}
    } else {

        var _val1 = irandom_range(0, num); 

        var _val2 = irandom_range(0, _val1 - 1); 

        _expression =
			{
				value_1 : _val1,
				value_2 : _val2,
				addition : _is_addition,
			}
		}

    return _expression;
}

state = 0

expression = get_random_expression(15);

layer_create(depth,"Particles")
psystem = part_system_create_layer("Particles",false);