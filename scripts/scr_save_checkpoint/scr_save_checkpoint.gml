function scr_save_checkpoint(){
if file_exists("checkpoint")
{
file_delete("checkpoint")	
}
  var checkpoint_x = obj_mainchara.x
var checkpoint_y = obj_mainchara.y
var checkpoint_room = room

ini_open("checkpoint")
	ini_write_real("Checkpoint","x",checkpoint_x)
	ini_write_real("Checkpoint","y",checkpoint_y)
	ini_write_real("Checkpoint","room",checkpoint_room)
	ini_write_string("Checkpoint","move",obj_mainchara.can_move)
	ini_write_string("Checkpoint","hp_k",global.hp_K)
	ini_write_string("Checkpoint","Max.hp_k",global.maxhp_K)
	ini_write_string("Checkpoint","hp_s",global.hp_S)
	ini_write_string("Checkpoint","Max.hp_s",global.maxhp_S)
	ini_write_string("Checkpoint","hp_r",global.hp_R)
	ini_write_string("Checkpoint","Max.hp_r",global.maxhp_R)
	ini_write_string("Checkpoint","hp_t",global.hp_T)
	ini_write_string("Checkpoint","Max.hp_t",global.maxhp_T)
	ini_write_string("Checkpoint","Followers",global.num_active_members)
	if instance_exists(obj_follower_suzy) 
	{ini_write_real("Checkpoint","follow_suzy",true)}
	if instance_exists(obj_follower_ralsei) 
	{ini_write_real("Checkpoint","follow_ralsy",true)}
	if instance_exists(obj_follower_Toriel_dark) 
	{ini_write_real("Checkpoint","follow_toriel",true)}
}