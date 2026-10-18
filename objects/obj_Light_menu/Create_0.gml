//create event
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]) - 50;


depth = - 99996;
active = true;
exiting = false

border_color = c_white;
color = c_white;

selected_button = 0;
button_count = 2; // Assuming there are THREE buttons (ITEMS, INFO, CELL) or in ITEMS (USE,INFO,DROP)


item_button_max = array_length(global.light_items) //the buttons are the same quantity as the items.
selected_item = 0;
did = 0;
_x = 0
_ys = 0



//global.numbers = ["Call home","Mike"]


numbers_call_max = array_length(global.numbers) 
selected_cell = 0;
