//Variabels
res=100;
//Modules
module cut() {
	hull() {	cylinder(r=9,h=15,center=true,$fn=res);
	translate([0,0,-10])sphere(9,$fn=res);}
}
module body() {
intersection() {
	cylinder(22,center=true);
	translate([0,0,8])cut();}
}

//Render
difference() {
	scale(v=[1.2,1.2,1])body();
	body();
}
