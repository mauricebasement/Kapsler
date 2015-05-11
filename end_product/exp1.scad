use <threadleg.scad>
res=100;
////////////////////////////////////////////////////////////////

module top() {
		cylinder(r=11,h=10,$fn=res);
		thread_out(24,12);
		rotate(a=[0,0,1])thread_out(24,12);
}

difference() {
	translate([0,0,5])cylinder(r=14,h=9,center=true,$fn=res);	
	translate([0,0,0])scale(v=[1,1,1])top();
}

////////////////////////////////////////////////////////////////

translate([0,30,0])thread_out(24,10);
translate([0,30,0])rotate(a=[0,0,1])thread_out(24,10);
translate([0,30,0])cylinder(r=11,h=10,$fn=res);