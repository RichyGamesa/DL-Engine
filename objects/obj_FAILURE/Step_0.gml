// Step Event
if something = 0 {
if (index < string_length(text_to_display)) {
    index += display_speed; // Increase index based on display speed
    displayed_text = string_copy(text_to_display, 1, index); // Extract text up to current index
    show_debug_message("Text not fully displayed yet.");
} else {
    displayed_text = text_to_display; // Ensure the full text is displayed when index exceeds its length
    show_debug_message("Text fully displayed. Setting alarm.");
    something = 1;
	alarm[0] = 60; // Set alarm to trigger after 60 steps (2 seconds assuming 30 steps/sec)
}
}