if (keyboard_check_pressed(ord("I")))	time_pause = !time_pause;
if (time_pause)	exit;

seconds += time_increment;
minutes = seconds/60;
hours = minutes/60;

darkness = hours/24;

if (hours >= 24) {
	seconds = 0;
	day += 1;
	with (Crops){
		event_perform(ev_other, ev_user1);
	}
	if (day > 30) {
		day = 1;
		season += 1;
		if (season > 4) {
			season = 1;
			year += 1;
		}
	}
}