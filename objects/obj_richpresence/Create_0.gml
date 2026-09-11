/// @description Initialize Discord.

#macro DISCORD_APP_ID "1487621035795808358"

ready = false;

state = ""

alarm[0] = 60;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}
