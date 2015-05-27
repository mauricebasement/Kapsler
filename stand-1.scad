use <threadleg.scad>
use <write/write.scad>

$fn=200;

//Modules
module cut() {
	hull() {
		translate([0,0,10])cylinder(r=10,h=50,center=true);
		translate([0,0,-29])cylinder(r=10,h=1);
	}
	for(x=[0,180])writecylinder("kapsler.li-",[0,0,-5],14.9,40,space=1.2,rotate=0,east=x,t=4,h=5);
}

module body() {
difference() {
	hull()union(){
	translate([0,0,38])cylinder(r=14.5,h=10,center=true);	
	cylinder(r=11,h=50,center=true);
	translate([0,0,11])cylinder(r=11,h=50-7,center=true);}
	translate([0,0,8])cut();}
}

//Render
module top() {
		translate([0,0,-3])cylinder(r=11,h=16);
		translate([0,0,0]){
			thread_out(24,12);
			rotate(a=[0,0,1])thread_out(24,12);
		}
}
difference() {
	body();
	translate([0,0,34])scale(v=[1.05,1.05,1.05])top();
}

