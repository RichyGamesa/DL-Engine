// Check if the image index has changed
window_set_caption("Deltarune chapter 3 ")
if (previousImageIndex != image_index) and image_index > 2 and image_index < 19 {
    // The image index has changed
    show_message("Image index changed!");
}
    
    // Update the previous image index
    previousImageIndex = image_index;