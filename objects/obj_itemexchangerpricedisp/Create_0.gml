owner = noone
add = 0
scroll = 0
scrollspd = 0.1
textsize = 0.5
letters = [
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
	"R","S","T","U","V","W","X","Y","Z",
	"1","2","3","4","5","6","7","8","9","0",
	"/"," ","+","-","*","=",":",";",",",".","?","|",
]

var fontatlas = string_join_ext("", letters)

myfont = font_add_sprite_ext(spr_wordsignletters, fontatlas, true, 8)