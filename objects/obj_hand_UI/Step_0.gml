x = mouse_x
y = mouse_y

var button = instance_place(x,y,tag_get_asset_ids("selectable",asset_object))

if button {
    image_index = button.cursor
} else image_index = 0