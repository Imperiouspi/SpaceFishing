/// @description This code happens every game frame

//Accelerate if "W" is held
vy += keyboard_check(87);


//Add velocity to position
y -= vy;
x += vx

//friction
if (vy > 0 and keyboard_check(ord("W")) == 0){
	if vy > 10 {
		vy -= (vy/10);
	}
	else {
		vy -= 1;
	}
}
if (vy < 0) {
	vy = 0;
}