// Create Event
audio_stop_all()
t_x = camera_get_view_x(view_camera[0])
t_y = camera_get_view_y(view_camera[0])
    if !instance_exists(obj_soul) 
	{
        instance_create_depth(t_x + 233, t_y + 133, -2, obj_soul);
        obj_soul.image_xscale = 0.5;
        obj_soul.image_yscale = 0.5;
    }
background = noone;
depth = -1
selected_button = 0;
button_count = 4; // Assuming there are four buttons (Shop, Sell, Talk, Exit)
// Arrays for shop items, prices, descriptions, and description types
shop_items = ["Water", "Glass", "Little sword", "Glowshard"];
shop_prices = [0, 0, 0, 0];
shop_desc_type = ["Item", "Item", "Weapon", "Item"]; // Adjust according to your needs
shop_desc = [
    "A cup of water",
    "A cup of glass",
    "An old sword",
    "A glowing shard"
];

bought = [false,false,false,false]
confirm_buy = false;
soul_buy = 0; //The yes and no option for buying items
buying_mode = false;
menu_shop_pos = -90;
dialogue = "Inspection"

//sell
sell_mode = false;
selected_option_sell = 0;
selected_sell = 0;
selected_an_option_sell = false;
array_lenght = 12 - count_non_empty_elements(global.items_dark)
array_sell = global.items_dark;
item_height = 25; // Height of each item
view_height = 150; // Height of the viewport
view_x = t_x + 20;
view_y = t_y + 140;
view_width = 250; // Width of the viewport
viewport_surface = surface_create(view_width, view_height); // Create the viewport surface
last_y = 0; //The last Y of the SOUL
scroll_y = 0
global.value = 0 //The price of the item you SELL
value = 0
eaten = false;

longness = array_length(global.items_dark);
longness_save = array_length(global.items_dark_save)
empty_longness = 12 - count_non_empty_elements(global.items_dark)
empty_longness_save = 45 - count_non_empty_elements(global.items_dark_save)
empty_longness_weapon = 48 - count_non_empty_elements(global.weapons)
empty_longness_armor = 48 - count_non_empty_elements(global.armors)
talk = false;
choose_talk = false //If you can choose what to talk about or it just talks (Seam is an example)


text_to_display = "Looking around the only thing you see is a mouse";
displayed_text = "";
index = 0;
display_speed = 1; // Adjust this global.value to control the speed of text display
something = 0;

welcome_message = "There is no one here";
leave_message = "...."
buy_message = "What can you take?"
buy_refuse = "You felt too bad"
buy_confirm = "You took it"
buy_0_dollars = "You don't have enough..."
buy_empty = "It isn't available";
sell_message = "What can you leave?"
sell_empty = "You don't have anything there"
sell_item = "What ITEMs do you have?"
sell_weapon = "What WEAPONs do you have?"
sell_armor = "What ARMORs do you have?"
sell_no =   "you kept it"
sell_yes = "You left it"
current_text = "There is no one here";
displayed_current = ""
displayed_current_index = 0;

Last_pos = 0;
music = Seams_Shop_Theme___Delta_Rune_OST;

if !audio_is_playing(music)
{
audio_play_sound(music,1,true)	
}

audio_sound_pitch(music,0.45)