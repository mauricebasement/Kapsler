use <threadleg.scad>
res=100;
////////////////////////////////////////////////////////////////

module top() {
		cylinder(r=11,h=10,$fn=res);
		for(i=[0,0.1,0.2])translate([0,0,i])union() {
			thread_out(24,14);
			rotate(a=[0,0,1])thread_out(24,14);
		}
}

difference() {
	translate([0,0,5])cylinder(r=14,h=10,center=true,$fn=res);	
	translate([0,0,0])scale(v=[1,1,1])top();
}

////////////////////////////////////////////////////////////////
*union() {
	for(i=[0,0.1,0.2])translate([0,0,i])union() {
		translate([0,30,0])thread_out(24,10);
		translate([0,30,0])rotate(a=[0,0,1])thread_out(24,10);
	}
	translate([0,30,0])cylinder(r=11,h=10,$fn=res);
}