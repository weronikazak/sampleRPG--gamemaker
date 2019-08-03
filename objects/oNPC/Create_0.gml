event_inherited();

r_spd = 3;
h_spd = 2;
w_spd = 1;
spd = h_spd;

x_frame = 1;
y_frame = 0;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

sBody = -1;
sHair = -1;
sTorso = -1;
sLegs = -1; 
sFeet = -1;
ssShadow = sShadow;

moveX = 0;
moveY = 0;

alarm[1] = 1;

portraitIndex = 0;
name = "Anonymous";
voice = snd_voice1;
text = ["This person has nothing to say"];
speakers = [id];
nextLine = [0];
canMove = true;

scripts = -1;