
var floorbeaten = global.maxfloor

var unlockedentities = array_length(global.unlockedentities)

phrase = $"|| {clamp(floorbeaten,0,99999)} FLOOR" + string((floorbeaten > 1 || floorbeaten = 0) ? "S" : "") + $" BEATEN || {unlockedentities} ENTIT" + string((unlockedentities > 1 || unlockedentities = 0) ? "IES" : "Y") + " IN THE CAFETERIA ||"