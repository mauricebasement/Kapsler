use <threadleg.scad>
use <write/write.scad>


//Variabels
res=100;
//Modules
module cut() {
	hull() {	translate([0,0,10])cylinder(r=9.5,h=50,center=true,$fn=res);
	translate([0,0,-20])sphere(9,$fn=res);}
	for(x=[0,180])writecylinder("kapsler.li-",[0,0,5],15.5,40,space=1.2,rotate=0,east=x,t=4,h=5);	
	writecylinder("kapsler.li",[0,0,-20],11,40,space=1.5,rotate=40,east=x,t=7,h=7);	
	writecylinder("kapsler.li",[0,0,-20],1,40,space=1.5,rotate=40,east=x,t=7,h=5);	
}
module body() {
difference() {
	hull()union(){
	translate([0,0,33])cylinder(r=14,h=10,center=true,$fn=res);	
	intersection(){
	translate([0,0,-12])scale(v=[1,1,1.5])sphere(11,$fn=res);
	cylinder(r=11,h=50,center=true,$fn=res);}
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
	translate([0,0,30])scale(v=[1.05,1.05,1.02])top();
}
