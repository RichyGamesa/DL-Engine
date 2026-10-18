var save = 0;
var file = "file";
if global.filechoiche = 1 {save = "save1.sav"}
if global.filechoiche = 2 {save = "save2.sav"}
if global.filechoiche = 3 {save = "save3.sav"}

if place_meeting(x,y, obj_mainchara)
{
	if file_exists(save)
	{
		file_delete(save)
	}
ini_open(save);
var SavedRoom = room;	
var SavedName = global.player_name
ini_write_real("Save1","room",SavedRoom);
ini_write_real("Save1","x",obj_mainchara.x);
ini_write_real("Save1","y",obj_mainchara.y);
ini_write_real("Save1","flag[1]",global.flag[1]);
ini_write_string("Save1","Player_name",SavedName)



game_save(global.filechoiche)
}
