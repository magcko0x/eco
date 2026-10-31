
var floorbeaten = array_length(global.beatenfloors)

var unlockedentities = array_length(global.unlockedentities)

var tokens = global.tokens

var _floor_count = $"|| {clamp(floorbeaten,0,99999)} FLOOR" + string((floorbeaten > 1) || floorbeaten == 0 ? "S" : "") + $" BEATEN "
var _entity_count = $"|| {unlockedentities} ENTIT" + string((unlockedentities > 1 || unlockedentities = 0) ? "IES" : "Y") + " IN THE CAFETERIA "
var _token_count = $"|| {tokens} TOKEN" + string((tokens > 1 || tokens = 0) ? "S" : "") + " ACQUIRED "

phrase = _floor_count + _entity_count + _token_count

addspace = false