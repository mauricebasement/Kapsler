//Variabels
res=100;
//Modules
module cut() {
	hull() {	cylinder(r=9.2,h=40,center=true,$fn=res);
	translate([0,0,-20])sphere(9,$fn=res);}
}
module body() {
difference() {
	cylinder(r=11,h=50,center=true,$fn=res);
	translate([0,0,8])cut();}
}

//Render
body();
