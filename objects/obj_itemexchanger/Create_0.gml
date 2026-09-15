event_inherited()



itemlist = [
	variable_clone(get_item_definition("battery")),
	variable_clone(get_item_definition("apple")),
	variable_clone(get_item_definition("compass")),
	variable_clone(get_item_definition("blossom")),
	variable_clone(get_item_definition("save")),
	variable_clone(get_item_definition("green sun")),
]

available_items = array_shuffle(itemlist)

selector = 0

itemarray = []

for (var i = 0; i < 3; i++) {
	
	itemarray[i] = array_pop(available_items)
	
}


for (var i = 0; i < 2; i++) {

	var myarrow = instance_create_depth(x,y,depth,obj_itemexchangerarrow)
	
	myarrow.owner = self
	
	if i = 1 {
		myarrow.image_xscale = -1	
	}
}

var mydisp = instance_create_depth(x,y,depth,obj_itemexchangerpricedisp)
mydisp.owner = self

var dropbox = instance_create_depth(x,y,depth,obj_itemexchangerdropbox)
dropbox.owner = self

var mylever = instance_create_depth(x + 16,y,depth,obj_itemexchangerlever)
mylever.owner = self

itemy = 0
itema = 0

timer = irandom_range(0,100)

colortimer = 0