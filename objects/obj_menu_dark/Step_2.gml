//end step
if power_menu_active == true
{
	//info text
	if global.num_active_members == 1
	{
	scr_info_member("Kris")
	}
	else
	scr_info_member(global.party_order[selected_info])	
}