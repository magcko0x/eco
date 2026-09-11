if type = 0 {
   change = 1
} else { 
   change = -1
}

image_xscale = change

buttonfunction = function () {
    obj_flexparts.remove_character_panels()
    obj_flexparts.create_character_panels(obj_flexparts.mytype,obj_flexparts.mypage + change)
}

cursor = 1

maxpages = 0

deac = false