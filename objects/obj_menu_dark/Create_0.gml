 //obj_menu_dark
// Create Event
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
menu_width = 640; // Width of the menu
item_height = 25; // Height of each item
item_spacing = 5; // Vertical spacing between items
max_items_per_row = 2; // Maximum number of items per row
item_width = (menu_width - 154) / max_items_per_row; // Width of each item
selected_button = 0;
selected_other = 0;
button_count = 4; // Assuming there are four buttons (ITEMS, EQUIP, POWER, OPTIONS)
active = true
image_alpha = 0;
depth = -9999; 

// Data structure for each member
global.memberData = [
    {
        name: "Kris",
        hp_points: global.hp_K,
        maxHp: global.maxhp_K,
		face: spr_kris_head,
        faceSprite: spr_krisb_face,
        hpBarColor: c_aqua
        // No amessage for Kris
    },
    {
        name: "Susie",
        hp_points: global.hp_S,
        maxHp: global.maxhp_S,
		face: spr_suzy_head,
        faceSprite: spr_susieb_face,
        hpBarColor: c_fuchsia,
    },
    {
        name: "Ralsei",
        hp_points: global.hp_R,
        maxHp: global.maxhp_R,
		face: spr_ralsei_head,
        faceSprite: spr_ralseib_face,
        hpBarColor: c_lime,
    },
    {
        name: "Toriel",
        hp_points: global.hp_T,
        maxHp: global.maxhp_T,
		face: spr_kris_head,
        faceSprite: spr_torielb_face_shop,
        hpBarColor: c_orange,
    }
];
        lastamessage2temp = ""
		lastamessage3temp = ""
		lastamessage5temp = ""
        amessage2temp = ""
		amessage3temp = ""
        amessage5temp= "" // Initialize with appropriate default global.value or empty string


// Additional Data structure for sub-menus

//info menu
selected_info = 0; //selected party member
name_selected = scr_get_spells; //the name of the selected party member
selected_power = -999; //selected power
selecting_magic = false;
distance_soul = 0;
dog = 0;
draw_lv = "";
draw_title = "";
tp = 0;
spell = [];
spell_desc = "";
members_when = global.num_active_members;
array_spell = global.spells_Kris;

//Item menu
item_menu_active = false;
equip_menu_active = false;
power_menu_active = false;
options_menu_active = false;
key_menu = false;
item_menu = false;
key_selected = 0;
item_selected = 0;
toss = false;
last_x = 0;    //Where the SOUL was
selected_party_member = 999; // Initialize to the first party member
old_selected_member = selected_party_member
selecting_item = true;
selecting_member = false;
using_item = false; // New variable to track if the item is being used
eaten = false
longness = array_length(global.items_dark);
lenght_key = array_length(global.items_key);
selected_old = selected_other;
isUneven = (key_selected % 2)
isUneven_item = (item_selected % 2)
more_reactions = false
old_reactions = false;
replaceable = false;
hp = 0
previous_hp = hp;
draw_hp = false;
move_hp = 0;
hp_alpha = 1;


//Equip menu
selected_member_equip = 0;
selecting_person = false;
selecting_weapon = false
selected_weapon = 0;
selecting_armor = false;
selected_weapon = 0;
selecting_bars = false;
selected_bar = 0;
equipping_kris = false;
equipping_susie = false;
equipping_ralsei = false;
equipping_toriel = false;
weapon = 0;
armor_I = 0;
armor_II = 0;
line_1 = 0
line_2 = 0
line_3 = 0
weapon_selected = 0
armor_selected = 0;
equipping_armor_slot = 0;
item_height = 25; // Height of each item
view_height = 150; // Height of the viewport
view_x = x + 363;
view_y = y + 230;
view_width = 250; // Width of the viewport
viewport_surface = surface_create(view_width, view_height); // Create the viewport surface
last_y = 0; //The last Y of the SOUL
scroll_y = 0
            weaponnametemp = stringsetloc("Little sword")
            weaponchar1temp = false  //Kris can equip
            weaponchar2temp = false //Susie can equip
            weaponchar3temp = false //Ralsei can equip
            weaponchar4temp = false //Noelle can equip
			weaponchara5temp = false//Toriel can equip
			
			armornametemp = stringsetloc(" ")
			armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
			
			amessagetemp_alpha = 1; // fully opaque initially
            amessagetemp_duration = 3; // display duration in seconds
            amessagetemp_fade_speed = 0.5; // fade speed in alpha per second§
			acomment = false;


//Options
option_selected = 0;
selected_volume = false;
val = "No";
fullscreen = "";
run = "";
controls = false;
selected_a_control = false;
selected_color = c_aqua //The color of the selected option 
