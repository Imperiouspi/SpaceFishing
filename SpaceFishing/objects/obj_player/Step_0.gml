/// @description This code happens every game frame

//Accelerate if "W" is held
if keyboard_check(87) == 1 {
	forwardHoldTime += 1;
	//show_debug_message(string(forwardHoldTime));
}
if(keyboard_check_released(87)){
	glide_start = forwardHoldTime
	glide = glide_start + glide_time*60
	forwardHoldTime = 0
}

if forwardHoldTime > 0 and forwardHoldTime/60 < bBellCurve{
	vy += aBellCurve * exp( (-power((forwardHoldTime/60 - bBellCurve),2)) / (2*power(cBellCurve,2)));
	d_coeff = water_drag
}
else if forwardHoldTime/60 > bBellCurve and vy > 0{
	d_coeff = paddle_drag + water_drag
}
else if forwardHoldTime == 0 and glide > glide_start{
	d_coeff = 0
	glide -=1
}
else if forwardHoldTime == 0 and glide <= glide_start{
	d_coeff = water_drag
}

//friction
if (vy > 0){
	vy -= power(vy,2)*d_coeff + extra_drag
}

if (vy < 0) {
	vy = 0;
}

//Add velocity to position
if(vy > maxvy){
	maxvy = vy
}
y -= vy;
x += vx
