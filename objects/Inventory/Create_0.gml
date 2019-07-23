depth = -1;
scale = 2;
cellSize = 32;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

invUIWidth = 288;
invUIHeight = 192;

sInv_UI = spr_inventory_UI;

invUI_x = (gui_width * 0.5) - (invUIWidth * 0.5 * scale);
invUI_y = (gui_height * 0.5) - (invUIHeight * 0.5 * scale);
