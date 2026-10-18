// Create Event
audio_stop_all()
t_x = camera_get_view_x(view_camera[0])
t_y = camera_get_view_y(view_camera[0])
depth = -1
background = seam_background
shop_keeper_x = (room_width/2) - 80;
shop_keeper_y = (room_height/2)- 110;
//these are the shopkeeper sprites
shop_keeper_image_index = 0;
shop_keeper_idle = spr_seam_idle;
shop_keeper_talk = spr_seam_talk;
shop_keeper_current_sprite = shop_keeper_idle;


selected_button = 0;
button_count = 4; // Assuming there are four buttons (Shop, Sell, Talk, Exit)
// Arrays for shop items, prices, descriptions, and description types
shop_items = ["CD Bagel", "TensionBit", "Water", "Amber Card"]; //the things itself
shop_prices = [100, 125, 30, 50]; //the price
shop_desc_type = ["Item", "Item", "Item", "Armor"]; // Adjust according to your type (Item,Armor,Weapon)
shop_desc = [ // the description
    "Musical CD",
    "A bit that gives you TP",
    "A glass of water that raises Defense.",
    "An orange and black sword."
];

confirm_buy = false;
soul_buy = 0; //The yes and no option for buying items
buying_mode = false;
menu_shop_pos = -90;


            weaponchar1temp = false
            weaponchar2temp = false
            weaponchar3temp = false
            weaponchar4temp = false
			weaponchara5temp = false
			
			

			armorchar1temp = false
            armorchar2temp = false
            armorchar3temp = false
            armorchar4temp = false
			armorchar5temp = false

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

//Talk menu
talk = false;
choose_talk = true //If you can choose what to talk about or it just talks (Seam is an example)
talk_choices = ["How are you?", "What do you sell?","Determination?","What should i ask you about?"] //this are the choices of dialogue
if global.flag[2] == true
{
talk_choices[0] = "Nihilism"
}
talk_new = [false,false,false,false] //this makes a text yellow
dialogue = "Inspection" //this is the default text of not chosing



text_to_display = "Looking around the only thing you see is a mouse";
displayed_text = "";
index = 0;
display_speed = 1; // Adjust this global.value to control the speed of text display
something = 0;
//these are the various messages 
welcome_message = "Welcome to my humble shop";
leave_message = "See you later, or maybe not. Ha ha"
buy_message = "What are you interested in?"
buy_refuse = "Too good for you?"
buy_confirm = "Thank you"
buy_0_dollars = "You don't have enough money..."
buy_empty = "I don't have any";
sell_message = "What do you have?"
sell_empty = "You don't have anything there"
sell_item = "What ITEMs do you have?"
sell_weapon = "What WEAPONs do you have?"
sell_armor = "What ARMORs do you have?"
sell_no =   "Changed your mind?"
sell_yes = "Thank you"
talk_message = "Not like i have anything better to do";
current_text = "Welcome to my humble shop";
displayed_current = ""
displayed_current_index = 0;

Last_pos = 0;
music = Seams_Shop_Theme___Delta_Rune_OST;

if !audio_is_playing(music)
{
audio_play_sound(music,1,true)	
}
