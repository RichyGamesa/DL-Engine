function scr_key_items(){
switch (global.items_key[obj_menu_dark.key_selected])
{
	case " ":
	global.key_item[0] = EMPTY;
    global.key_item_name[0] = " ";
    global.key_item_description[0] = " ";
    global.key_type[0] = nothing
    global.key_item_usage[0] = " ";
    break;
	
    case "Cell phone":
    global.key_item[1] = Cell_phone;
    global.key_item_name[1] = "Cell phone";
    global.key_item_description[1] = "* It can be used to make calls.";
    global.key_type[1] = used_close
    global.key_item_usage[1] = "* (You tried to call on the cell phone)";
	break;

    case "Star Walker":
    global.key_item[2] = Star_Walker;
	global.key_item_name[2] = "Star Walker";
    global.key_item_description[2] = "I'm the ORIGINAL                             starwalker";
    global.key_type[2] = used;
    //global.key_item_usage[2] = audio_play_sound(snd_lancerlaugh,0,false);
    break;
	
	case "Lancer":
    global.key_item[3] = Lancer;
	global.key_item_name[3] = "Lancer";
    global.key_item_description[3] = "HOHO! Hello clowns";
    global.key_type[3] = used;
    //global.key_item_usage[3] = audio_play_sound(snd_lancerlaugh,0,false);
    break;

    case "Roulxs Kaard":
    global.key_item[4] = Roulxs;
    global.key_item_name[4] = "Roulxs Kaard";
    global.key_item_description[4] = "* HELLOETH WORMS.";
    global.key_type[4] = used;
    //global.key_item_usage[4] = audio_play_sound(snd_lancerlaugh,0,false);
	break;
	
	    case "object":
    global.key_item[5] = object;
    global.key_item_name[5] = "object";
    global.key_item_description[5] = "* Some object, i don't know what.";
    global.key_type[5] = used; //This can be used if it just makes a sound, or used_close if it closes the menu and opens the textbox
    //global.key_item_usage[4] = audio_play_sound(snd_lancerlaugh,0,false);
	break;
}
}