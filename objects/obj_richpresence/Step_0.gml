/// @description Update NekoPresence so async events will execute.

np_update();

if room != rm_elevator && room != rm_lobby_elevator { 
    if room != rm_lobby_start && room != rm_lobby_pre_elevator && room != rm_lobby_character {
        
        if global.floor = 0 state = "Working hard at The Industry."
            
        if global.floor = 1 state = "Breathing some fresh air at the Floating Plateau."
            
    } else state = "Preparing for the next run in The Lobby." 
        
} else state = "Awaiting their fate in The Elevator."
    
np_setpresence(state, "", "", "")