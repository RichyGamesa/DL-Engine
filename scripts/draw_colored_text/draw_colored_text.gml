// Function to draw text with color handling
function draw_colored_text(_drawtext, _x, _y, _sep, _w, color_markers) {
    var text_length = string_length(_drawtext);
    var segments = ds_list_create();
    var last_pos = 1;
    var current_color = c_white;
    
    var keys_array = ds_map_keys_to_array(color_markers); // Retrieve keys directly
    
    while (last_pos <= text_length) {
        var next_pos = text_length + 1;
        var marker = "";
        
        for (var i = 0; i < array_length_1d(keys_array); i++) {
            var key = keys_array[i];
            var marker_pos = string_pos(string(key), string_copy(_drawtext, last_pos, text_length - last_pos + 1));
            if (marker_pos > 0 && (last_pos + marker_pos - 1) < next_pos) {
                next_pos = last_pos + marker_pos - 1;
                marker = key;
            }
        }
        
        var segment = string_copy(_drawtext, last_pos, next_pos - last_pos);
        ds_list_add(segments, segment);
        
        if (marker != "") {
            ds_list_add(segments, marker);
            last_pos = next_pos + string_length(marker);
        } else {
            break;
        }
    }
    
    var x_offset = 0;
    var y_offset = 0;
    for (var i = 0; i < ds_list_size(segments); i++) {
        var segment = ds_list_find_global.value(segments, i);
        
        if (ds_map_exists(color_markers, segment)) {
            current_color = color_markers[? segment];
        } else {
            var width = string_width(segment);
            if (x_offset + width > _w) {
                x_offset = 0;
                y_offset += _sep;
            }
            
            draw_set_color(current_color);
            draw_text(_x + x_offset, _y + y_offset, segment);
            x_offset += width;
        }
    }
    
    ds_list_destroy(segments);
}
