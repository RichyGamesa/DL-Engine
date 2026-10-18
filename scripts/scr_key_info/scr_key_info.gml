// function scr_key_info
function scr_key_info(argument0){
// Debug message to check if the function is executed
    show_debug_message("scr_key_info function called with argument: " + string(argument0));


//this are the various descriptions of the key items

if argument0 == "Cell Phone"
{
  global.key_description = "* It can be used to make calls.";
}
if argument0 == "Star Walker"
{
   global.key_description = "I'm the ORIGINAL                             starwalker";
}
if argument0 == "Lancer"
{
   global.key_description = "HO HO HO! Hello clowns!"
}
if argument0 == "Roulxs Kaard"
{
   global.key_description = "WE ARE BACKETH AT OUR OWN CASTLE TOWNETH ONCE MORE."
}
if argument0 == "object"
{
global.key_description = "A random object."	
}
//we will use this as an example

}