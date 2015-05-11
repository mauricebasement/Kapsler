use<threadleg.scad>


//Variabels
res=200;

gum_h=2;
gum_r=18.2/2;

output_r=7;

cube_l=30;

capsule_top=9/2+0.2;
capsule_bottom=18;
capsule_rest=16;

screw_r=1.4;

margin=2;

h1=cube_l/2+5;
d1=sqrt(capsule_top*capsule_top*2);

//Modules
module screw_hole() {
	cylinder(r=screw_r*0.95,h=4,$fn=res);
	translate([0,0,4])cylinder(r1=screw_r*0.95,r2=5.6/2,h=3.8,$fn=res);
	translate([0,0,7.8])cylinder(r=5.6/2,h=3.1,$fn=res);
}
module gum() {
	cylinder(r=gum_r,h=gum_h,center=true,$fn=res);
}
module cut() {
	translate([0,0,-cube_l/2+gum_h/2])gum();
	translate([0,0,-20])cylinder(r1=9.3,r2=8.6,h=5,$fn=res);
	translate([0,0,5])screw_hole();
	exhaust();
	hull() {
		exhaust_cut();
		translate([0,0,-cube_l/2+(capsule_rest-4)-1])cylinder(r=capsule_top,h=capsule_rest+4,center=true,$fn=res);
	}
}

module exhaust_cut() {
	intersection() {
		translate([0,0,0])cylinder(r=30,h=6);
		exhaust();
	}
}
	
module exhaust() {
	for(x=[0:6]) {
		rotate(a=[5,0,x*360/7])translate([0,-3.7,0])cylinder(r=1.2,h=20,$fn=res/2);
	}
}

module body() {
	scale(v=[0.98,0.98,1]) {
		translate([0,0,-20])thread_out(24,10);
		translate([0,0,-20])rotate(a=[0,0,0.5])thread_out(24,10);
	}
	hull(){translate([0,0,-5])cylinder(r1=capsule_bottom/2+margin,r2=capsule_bottom/2+margin-4,h=30-10,center=true,$fn=res);
	translate([0,0,-20])cylinder(r=capsule_bottom/2+margin,h=7,$fn=res);
	translate([0,0,10])cylinder(r=capsule_bottom/2+margin-4,h=10,center=true,$fn=res);}
	hull()translate([0,0,15-1.3+0.8])ring();
}
//Render
difference() {
	body();
	cut();
}
module ring() {
	rotate(a=[180,0,0])intersection() {
		rotate_extrude($fn=res)translate([capsule_bottom/2+margin-4,0])circle(r=2,$fn=res/4);
		translate([0,0,-1.3])cylinder(r=capsule_bottom/2+margin,h=5);
	}
}
