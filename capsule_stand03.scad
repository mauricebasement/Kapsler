//Variabels
res=200;
//Modules
module cut() {
	hull() {	cylinder(r=9.3,h=40,center=true,$fn=res);
	translate([0,0,-20])sphere(9,$fn=res);}
}
module body() {
difference() {
	hull()union(){intersection(){
	translate([0,0,-12])scale(v=[1,1,1.5])sphere(11,$fn=res);
	cylinder(r=11,h=50,center=true,$fn=res);}
	translate([0,0,6])cylinder(r=11,h=50-12,center=true,$fn=res);}
	translate([0,0,8])cut();}
}

//Render

body();