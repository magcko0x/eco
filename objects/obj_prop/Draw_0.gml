switch mode {
    case 0:
        draw_self()
        break;
    case 1:
        
        var w,h
        
        w = sprite_get_width(sprite_index) / 2
        h = sprite_get_height(sprite_index) / 2
        
        var frequency,amplitude

        frequency = 0.012
        amplitude = 4
        
        timer += frequency;
        
        var y_offset = sin(timer) * amplitude;
        
        var angle_offset = cos(timer) * amplitude
        
        
        draw_sprite_pos(sprite_index,image_index,
            x - w + angle_offset + 2, y - h,
            x + w + angle_offset + 2, y - h,
            x + w, y + h,
            x - w, y + h,
            1
        )
        break;
}