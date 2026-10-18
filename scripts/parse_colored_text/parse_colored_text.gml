function parse_colored_text(text) {
    var segments = [];
    var color = c_white;
    var start = 1;
    var len = string_length(text);
    var tag_start, tag_end;
    
    while (start <= len) {
        tag_start = string_pos("{", string_copy(text, start, len));
        if (tag_start > 0) {
            tag_start += start - 1;
            tag_end = string_pos("}", string_copy(text, tag_start, len));
            if (tag_end > 0) {
                tag_end += tag_start - 1;
                // Text before the tag
                var segment = string_copy(text, start, tag_start - start);
                if (string_length(segment) > 0) {
                    array_push(segments, {text: segment, color: color});
                }
                // Update color
                var tag = string_copy(text, tag_start + 1, tag_end - tag_start - 1);
                color = get_color_from_tag(tag);
                start = tag_end + 1;
            } else {
                break;
            }
        } else {
            // No more tags
            var segment = string_copy(text, start, len - start + 1);
            array_push(segments, {text: segment, color: color});
            break;
        }
    }
    return segments;
}