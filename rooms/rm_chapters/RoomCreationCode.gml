global.choice = 0;
global.initialized = false;
// Call the initialization script
if (global.initialized == false) {
    global.initialized = true; // Set a flag to ensure the script runs only once
    // Call your initialization script here
    scr_Gamestart(); 
}

