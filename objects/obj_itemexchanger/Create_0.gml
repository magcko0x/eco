event_inherited()



itemlist = [
	[0,10],
	[1,5],
	[2,50],
	[3,100],
	[4,100],
	[5,100],
	[6,100],
	[7,500]
]

unavailable_items = [4,5]

available_items = []

array_copy(available_items,0,itemlist,0,array_length(itemlist))

for (var i = array_length(unavailable_items) - 1; i > -1; i--) {
	array_delete(available_items,unavailable_items[i],1)
}

available_items = array_shuffle(available_items)

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