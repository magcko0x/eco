depth = 5000

space = "   "

number = global.currentroom+1
scroll = 0
add = 0
index = 0
letters = [
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
	"R","S","T","U","V","W","X","Y","Z",
	"1","2","3","4","5","6","7","8","9","0",
	"/"," ","+","-","*","=",":",";",",",".","?","|",
]

var fontatlas = string_join_ext("", letters);

myfont = font_add_sprite_ext(spr_wordsignletters, fontatlas, true, 8);

phrase = string_upper(phrase)
if addspace 
	line = phrase + space
else
	line = phrase
alarm[0] = 2