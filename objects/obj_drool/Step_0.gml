image_alpha -= 0.02
image_xscale = startxscale * clamp(image_alpha,0,1)
image_yscale = startyscale * clamp(image_alpha,0,1)

if image_alpha < 0 instance_destroy()