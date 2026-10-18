//@Party member The name of the party member
//@hp  the amount to heal
function Scr_healtarget(argument0,argument1){


if argument0 == "Kris"
{
   	global.hp_K += argument1
	if global.hp_K > global.maxhp_K
	{global.hp_K = global.maxhp_K}
	
}
if argument0 == "Susie"
{
   	global.hp_S += argument1
	if global.hp_S > global.maxhp_S
	{global.hp_S = global.maxhp_S}
	
}
if argument0 == "Ralsei"
{
   	global.hp_R += argument1
	if global.hp_R > global.maxhp_R
	{global.hp_R = global.maxhp_R}
	
}
if argument0 == "Toriel"
{
   	global.hp_T += argument1
	if global.hp_T > global.maxhp_T
	{global.hp_T = global.maxhp_T}
	
}

}