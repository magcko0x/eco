if mode = 0 {
    if global.floor + 1 < global.maxfloor { 
        draw_selected()
        cursor = 1
        deac = false
    } else deac = true
}
    
if mode = 1 {
    if global.floor - 1 > -2 { 
        draw_selected()
        deac = false
    } else deac = true
}

draw_self()