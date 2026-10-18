/// Script: remove_color_markers

/// remove_color_markers(text)
/// Removes color markers from the given text.

function remove_color_markers(text) {
    var output = string(text);
    var marker_keys = ds_map_keys_to_array(color_markers);
    
    for (var i = 0; i < array_length(marker_keys); i++) {
        var marker = marker_keys[i];
        output = string_replace_all(output, marker, "");
    }
    
    return output;
}
