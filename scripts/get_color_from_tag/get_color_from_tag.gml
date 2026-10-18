function get_color_from_tag(tag) {
    switch (tag) {
        case "CR": return c_red;
        case "CW": return c_white;
        case "CY": return c_yellow;
        case "CB": return c_blue;
        case "c_black": return c_black;
        // Add more color cases as needed
        default: return c_white;
    }
}