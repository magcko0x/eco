setdepth()

image_xscale = lerp(image_xscale,0,0.1)
image_yscale = lerp(image_yscale,0,0.1)

if image_xscale <= 0.05 && image_yscale <= 0.05 {
	instance_destroy()	
}