if global.floor = "floor_floating_plateau" {
    gradient = layer_get_fx("Background")
    
    if instance_exists(obj_lightsout) {
        if gradient != -1 { 
            gradientparams = fx_get_parameters(gradient)
                
            gradientparams.g_GradientColour1 = [51/255,61/255,109/255,255/255]
            gradientparams.g_GradientColour2 = [75/255,90/255,178/255,255/255]
                
            fx_set_parameters(gradient, gradientparams); 
        }
    } else {
        if gradient != -1 { 
            gradientparams = fx_get_parameters(gradient)
                
            gradientparams.g_GradientColour1 = [115/255,123/255,173/255,255/255]
            gradientparams.g_GradientColour2 = [177/255,183/255,219/255,255/255]
                
            fx_set_parameters(gradient, gradientparams); 
        }  
    }
}