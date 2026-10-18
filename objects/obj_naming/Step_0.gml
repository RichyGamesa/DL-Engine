/// obj_namescreen Step Event
global.fake = 0;


// Handle text input
if (keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_shift))
{
    // Remove the last character from the name
    if (string_length(player_name) > 0)
	{
        player_name = string_delete(player_name, string_length(player_name), 1);
    } 
}
else
{
    // Check for input of alphanumeric characters
    for (var i = 65; i <= 90; i++) 
	{
        if (keyboard_check_pressed(i)) 
		{
            if (string_length(player_name) < max_name_length)
			{
                player_name += chr(i);
            }
        }
    }
    if (keyboard_check_pressed(vk_space)) {
        if (string_length(player_name) < max_name_length)
		{
            player_name += " ";
        }
    }
}

// obj_confirm_button Enter Pressed Event
if (string_length(player_name) > 0) and player_name != "" and player_name != " " {
 if (keyboard_check_pressed(vk_enter)) and event = 0 {
    instructions = "IS THIS CORRECT?"
	keyboard_clear(vk_enter)
	event = 1;
}

if  (keyboard_check_pressed(vk_enter)) and event = 1 
{
	event = 2;
}
else if (keyboard_check_pressed(vk_shift)) and event = 1 
{
	instructions = "WRITE YOUR OWN NAME"
	event = 0;
}
if event = 2 
{
		global.player_name = player_name;
		if global.player_name == "NOELLE" {global.sideb = true}
		if global.player_name == "RICHY" or global.player_name == "DLLEAK" or global.player_name == "DL LEAK" or global.player_name == "SHINSE" {global.fake = 1;} 
	 room_goto(rm_cutscene_start)
}
}

if event = 1 
{
	
if 	player_name = "RICHY" or player_name = "DLLEAK" or player_name = "DL LEAK" or player_name = "SHINSE"
{
instructions = "THE CREATOR?"
global.fake = true;
}
else
{
global.fake = false;
}

if 	player_name = "KRIS" or player_name = "SUSIE"
{instructions = "YOU WILL MEET SOMEONE VERY, VERY INTERESTING"}
if player_name = "NOELLE"
{instructions = "YOU HAVE DONE UNSPEAKABLE THINGS"}
if 	player_name = "MIKE" or player_name = "TENNA"
{instructions = "INTERESTING"}
if 	player_name = "TORIEL" or player_name = "UNDYNE" or player_name = "ASRIEL" or player_name = "QC" or player_name = "GERSON " or player_name = "ALVIN" or player_name = "PAPYRUS" or player_name = "SANS" 
{instructions = "AN INTERESTING COINCIDENCE"}
if player_name == "DESS" 
{instructions = ". . ."}
/*if 	player_name = "MERG"
{instructions = "A TALKING CHERRY?"}
if 	player_name = "STAR" or player_name = "MOLLYSTAR" or player_name = "MOLLYSTARS" 
{instructions = "THE VOICE OF THE MACHINE"}
if 	player_name = "JARU" or player_name = "JARUJARU" 
{instructions = "THE NAME REPEATS ITSELF"}
*/
}

if player_name = "NOELLE"
{
audio_sound_pitch(AUDIO_NAME,0.60)
}
else
{audio_sound_pitch(AUDIO_NAME,1)}




























if event = 0 or event = 1 {
if 	player_name = "GASTER"
{instructions = "THAT IS WRONG"
	game_restart()}
	if 	player_name = "WDGASTER" or player_name = "WD GASTER"
{instructions = "NO ONE KNOWS THAT NAME HERE"
	game_end()}
	if player_name == "DECEMBER"
	{instructions = "IS SOMEONE THERE?!"
		game_restart()
		}

	
}
	 
  



