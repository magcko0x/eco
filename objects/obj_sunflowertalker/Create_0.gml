depth = -9999

text = [
	"You're very funny.",
	"Very funny indeed.",
	"You dare come to my place...",
	"Stain my carpets with your oil...",
	"...",
	"And still demand to know how these things work?",
	"Golly.",
	"You're so funny."
]

filtered_text = text
postext = text
filter = false
lastchar = 0

restart = false

if !restart {
	global.interact = false
}

timer = 160
charcount = 0
page = 0
creator = 0
textpart = 0
xbuffer = 10
ybuffer = 10
txtspd = 0.25

stringheight = string_height(text[page])

//boxwidth = sprite_get_width(spr_textbox)-2*xbuffer\

//Text codes
textcode = ["/default","/frown","/sad","/angry","/mischievious","/horny","/surprised","/laughing"]