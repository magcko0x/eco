#macro INVENTORY_SLOTS 5
row_length = 5
inventorylength = array_length(obj_playerhandler.playerinventory)
pos = 0
prevpos = 0
previtem = 0

namealpha = 1
desc = ""
name = ""

invx = 480 - ((12+row_length*36)/2)
invy = 480

keyinvx = 480 + ((12 + row_length * 36)/2)
keyinvy = 480

keyshakex = 0
keyshakey = 0
keyshake_strength = 4

pflip = array_create(INVENTORY_SLOTS,-1)
flip = array_create(INVENTORY_SLOTS,-1)

characters = "0123456789C"

currentcredits = 0

myfont = font_add_sprite_ext(spr_credit_numbers, characters, true, 4)

showcredits = false