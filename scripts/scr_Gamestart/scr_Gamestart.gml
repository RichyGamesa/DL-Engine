//scr Gamestart
global.filechoiche = "  "
global.chapter = 3;
global.darkworld = false;
global.fake = true;
global.cutscene = false;
global.time = 0;

global.in_cutscene = true;
global.members = 0;
global.num_active_members = 1;
global.FUN = 666;
global.selected_choice = 0;
global.dialogue = false;
global.dead = 0;

ini_open("configurations.ini")
global.fullscreen = ini_read_real("SCREEN","Fullscreen",false)
global.volume = ini_read_real("Settings","Volume",100)
ini_close()
global.current_song = 0;

global.sideb = false;
global.sidec = false;
global.plot = 0;
global.flag[0] = false;
flag_list()

//Keyboard controls things

ini_open("keyconfig_0.ini")
global.down = ini_read_real("KEYBOARD","down",vk_down)
global.right = ini_read_real("KEYBOARD","right",vk_right)
global.up = ini_read_real("KEYBOARD","up",vk_up)
global.left = ini_read_real("KEYBOARD","left",vk_left)
global.confirm = ini_read_real("KEYBOARD","confirm",ord("Z"))
global.cancel = ini_read_real("KEYBOARD","cancel",ord("X"))
global.menu = ini_read_real("KEYBOARD","menu",ord("C"))
ini_close()


//Lightworld things
	global.last_x = 0;
	global.last_y = 0;
	global.last_depth = 0;
	global.last_room = room;
	
global.Light_hp = 20; //the hp
global.Light_maxhp = 20; //the max hp
global.L_at = 10;
global.L_df = 10;
global.L_wp_atk = 1;  //Wepon attack
global.L_armor_def = 1;  //Armor defense
global.L_money = 2;     //The $
global.L_xp = 0;
global.next_Lv = 10;
global.L_lv = 1; 
global.L_weapon = "Pen";
global.L_armor  = "Eraser"
global.PlayerSpares = 0;
global.PlayerKills = 0

global.light_items = ["Ball of junk", "Cards","Egg"]
global.Litem_description = " ";
global.droppable = false;
global.Litem_drop = " ";
global.Litem_usage = " ";
global.use_and_delete = false;
global.numbers = ["Call home","Mike"]

global.light_vessel_name = "Kris"
global.player_name = " ";
global.vesselname = " ";
global.user_name = environment_get_variable("USERNAME")

/* Darkworld things */
global.hp_K = 160;
global.maxhp_K = 160;
global.atk_K = 12;
global.real_atk_K = global.atk_K
global.df_K = 2;
global.real_df_K = global.df_K
global.mag_K = 0;
global.real_mag_K = global.mag_K
global.current_weapon_atk_K = 0;
global.current_weapon_df_K = 0;
global.current_weapon_mag_K = 0;
global.current_armor1_atk_K = 0;
global.current_armor1_df_K = 0;
global.current_armor1_mag_K = 0;
global.current_armor2_atk_K = 0;
global.current_armor2_df_K = 0;
global.current_armor2_mag_K = 0;

global.hp_S = 190;
global.maxhp_S = 190;
global.atk_S = 14
global.real_atk_S = global.atk_S
global.df_S = 2;
global.real_df_S = global.df_S
global.mag_S = 2;
global.real_mag_S = global.mag_S
global.current_weapon_atk_S = 0;
global.current_weapon_df_S = 0;
global.current_weapon_mag_S = 0;
global.current_armor1_atk_S = 0;
global.current_armor1_df_S = 0;
global.current_armor1_mag_S = 0;
global.current_armor2_atk_S = 0;
global.current_armor2_df_S = 0;
global.current_armor2_mag_S = 0;

global.hp_R = 140;
global.maxhp_R = 140;
global.atk_R = 10
global.real_atk_R = global.atk_R
global.df_R = 2;
global.real_df_R = global.df_R
global.mag_R = 9;
global.real_mag_R = global.mag_R
global.current_weapon_atk_R = 0;
global.current_weapon_df_R = 0;
global.current_weapon_mag_R = 0;
global.current_armor1_atk_R = 0;
global.current_armor1_df_R = 0;
global.current_armor1_mag_R = 0;
global.current_armor2_atk_R = 0;
global.current_armor2_df_R = 0;
global.current_armor2_mag_R = 0;

global.hp_T = 210;
global.maxhp_T = 210;
global.atk_T = 16;
global.real_atk_T = global.atk_T
global.df_T = 4;
global.real_df_T = global.df_T
global.mag_T = 6;
global.real_mag_T = global.mag_T
global.current_weapon_atk_T = 0;
global.current_weapon_df_T = 0;
global.current_weapon_mag_T = 0;
global.current_armor1_atk_T = 0;
global.current_armor1_df_T = 0;
global.current_armor1_mag_T = 0;
global.current_armor2_atk_T = 0;
global.current_armor2_df_T = 0;
global.current_armor2_mag_T = 0;


global.area = 0;
global.gold = 1000;


// Define spells for each party member
global.spells_Kris = [
    { name: "ACT", description: "Can do all sort of things. Isn't magic", tpCost: 0 },
];

global.spells_Susie = [
    { name: "Rude Buster", description: "Deal Rude-elemental damage to an enemy", tpCost: 50 },
    { name: "UltimatHeal", description: "Heals a party member to the best of Susie abilities", tpCost: 100 }
];

global.spells_Ralsei = [
    { name: "Pacify", description: "SPARE a TIRED enemy by putting them to SLEEP.", tpCost: 20 },
    { name: "Heal Prayer", description: "Heal a Party Member with HEAVENLY light", tpCost: 35 }
];

global.spells_Toriel = [
    { name: "Pacify", description: "SPARE a TIRED enemy by putting them to SLEEP.", tpCost: 20 },
    { name: "Heal Prayer", description: "Heal a Party Member with HEAVENLY light", tpCost: 35 },
	{ name: "Hot Spray", description: "Create a HOT cloud to distract the enemy to ESCAPE.", tpCost: 50 },
    { name: "Fire ball", description: "Deal Fire-elemental damage to an enemy", tpCost: 25 }
];
scr_spell_map()
scr_get_spells("Kris")



global.member[0] = true;   //Kris is in the party
global.member_LV[0] = 3;
global.member_title[0] = "Leader"
global.weapon[0] = "Wood Blade"
global.armor_1[0] = " "
global.armor_2[0] = " "



global.member[1] = false;  //Susie is in the party
global.member_LV[1] = 3;
global.member_title[1] = "Dark knight"
global.weapon[1] = "Mane Ax"
global.armor_1[1] = " "
global.armor_2[1] = " "

global.member[2] = false;  //Ralsei is in the party
global.member_LV[2] = 3;
global.member_title[2] = "Fluffy prince"
global.weapon[2] = "Red Scarf"
global.armor_1[2] = " "
global.armor_2[2] = " "

global.member[3] = false;  //Toriel is in the party
global.member_LV[3] = 2;
global.member_title[3] = "Mage"
global.weapon[3] = "Coverbook"
global.armor_1[3] = " "
global.armor_2[3] = " "


global.party_order = ["Kris"]
global.real_party = [obj_fake_kris]
global.total_hp = global.hp_K;
global.member_info = "";
global.bulletzone = false;
global.level = 3;  //the level in the Darkworld (it's actually just the number of the chapter)

global.items_dark = [] //Initialize the varible
items_dark_list() //Actual list of items (This is the items they START with, not their inventory, never call this script)
global.items_dark_save  = [ "Glowshard", "Glowshard"] //The extra menu contained in the save star
items_dark_save_list() //Actual list of items in thesavefiles (This is the items they START with, not their inventory, never call this script)
global.items_key = ["Cell Phone","Lancer","Roulxs Kaard","Star Walker"]
global.key_description = " "; // The description of the items (needs to be empty for initialization)
global.item_desc = " "; // The description of the items (needs to be empty for initialization)
global.itemtarget = 0; //How many party members it heals (0 is just for initialization)
global.usable = false //If an item can be used in the dark menu

global.weapons = [] //Initialize variable
global.weapondesctemp = " " // The description of the Weapons (needs to be empty for initialization)
global.weaponabilitytemp = " " //The ability that appear as text in equip menu
global.weaponicontemp = spr_symbol_mini_sword //The icon near the name of the WEAPON (sword for kris, axe for susie, scarf for ralsei)
global.weaponabilityicontemp = spr_symbol_mini_evil //The icon of the ability assigned earlier
            global.weaponattemp = 0
            global.weapondftemp = 0
            global.weaponmagtemp = 0
weapon_list() //Actual list of weapons (This is the weapons they START with, not their inventory, never call this script)

global.armors = [] //Initialize variable
global.armordesctemp = " "; // The description of the armor (needs to be empty for initialization)
global.armorabilitytemp = " " //The ability that appears as text in the equip menu
global.armoricontemp = spr_symbol_mini_shield;  //The icon near the name of the ARMOR
global.armorabilityicontemp = spr_symbol_mini_empty; //The icon of the ability assigned earlier
            global.armorattemp = 0 
            global.armordftemp = 0
            global.armormagtemp = 0
armor_list() //Actual list of Armors (This is the armors they START with, not their inventory, never call this script)


global.level_member = 0; //The "level" of the party member.
global.desciption_member = ""; //The description of the party member

global.battle = false;
global.tp = 0;




