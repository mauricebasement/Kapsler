use<threadleg.scad>

//Variabels
res=200;
//Modules
module cut() {
	hull() {	translate([0,0,10])cylinder(r=9.3,h=50,center=true,$fn=res);
	translate([0,0,-20])sphere(9,$fn=res);}
}
module body() {
difference() {
	hull()union(){
	translate([0,0,33])cylinder(r=13,h=10,center=true,$fn=res);	
	intersection(){
	translate([0,0,-12])scale(v=[1,1,1.5])sphere(11,$fn=res);
	cylinder(r=11,h=50,center=true,$fn=res);}
	translate([0,0,11])cylinder(r=11,h=50-7,center=true,$fn=res);}
	translate([0,0,8])cut();}
}

//Render
module top() {
		cylinder(r=11,h=10,$fn=res);
		thread_out(24,10);
}

difference() {
	body();
	translate([0,0,33])top();
	translate([0,0,33])rotate(a=[0,0,1])top();
}
