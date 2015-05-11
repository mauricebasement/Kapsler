use <threadleg.scad>
use <write/write.scad>


//Variabels
res=100;
//Modules
module cut() {
	hull() {	translate([0,0,10])cylinder(r=9.5,h=50,center=true,$fn=res);
	translate([0,0,-20])sphere(9,$fn=res);}
	for(x=[0,180])writecylinder("kapsler.li-",[0,0,-5],14.9,40,space=1.2,rotate=0,east=x,t=4,h=5);
	scale(v=[1,0.5,1.5])translate([0,0,-2])rotate(a=[45,0,0])cube([40,10,10],center=true);
	scale(v=[0.5,1,1.5])translate([0,0,-7])rotate(a=[45,0,90])cube([40,10,10],center=true);

}
module body() {
difference() {
	hull()union(){
	translate([0,0,33])cylinder(r=14,h=10,center=true,$fn=res);	
	cylinder(r=11,h=50,center=true,$fn=res);
	translate([0,0,11])cylinder(r=11,h=50-7,center=true,$fn=res);}
	translate([0,0,8])cut();}
}

//Render
module top() {
		cylinder(r=11,h=10,$fn=res);
		thread_out(24,12);
		rotate(a=[0,0,1])thread_out(24,12);
}
difference() {
	body();
	translate([0,0,30])scale(v=[1.1,1.05,1.02])top();
}

