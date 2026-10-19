//scr_Gamestart()
if file_exists("save.sav"){
 ini_open("save.sav");
 startRoom =ini_read_real("Save1","room",rm_kris_room);
 startX = ini_read_real("Save1","x",0);
 startY = ini_read_real("Save1","y",0);
 global.flag[1] = ini_read_real("Save1","Flag[1]",false)
SavedName = ini_read_string("Save1","Player_name","help ")
 ini_close()
}
     