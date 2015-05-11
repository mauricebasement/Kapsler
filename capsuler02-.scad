//Variabels
res=100;

gum_h=6;
gum_r=18/2;

output_r=7;

cube_l=30;

capsule_top=9/2;
capsule_bottom=18;
capsule_rest=16;

screw_r=1.4;

h1=cube_l/2+5;

//Modules
module screw_hole() {
	cylinder(r=screw_r,h=10,center=true,$fn=res);
	translate([0,0,7.5])cylinder(r1=screw_r,r2=screw_r*1.2,h=5,center=true,$fn=res);
}
module gum() {
	cylinder(r=gum_r,h=gum_h,center=true,$fn=res);
}
module cut() {
	translate([0,0,-cube_l/2+gum_h/2])gum();
	translate([0,0,-cube_l/2+(capsule_rest-4)])cylinder(r=capsule_top,h=capsule_rest+2,center=true,$fn=res);
	translate([0,0,5])screw_hole();
	hull(){rotate(a=[0,90,0])translate([0,0,h1/2+1])cylinder(r=5,h=h1,center=true,$fn=res);
	translate([cube_l/2+7,0,cube_l/2-2.5-4])cylinder(r=5,h=cube_l/2-6,center=true,$fn=res);}
	translate([cube_l/2+7,0,cube_l/2+4])cylinder(r=5,h=cube_l/2,center=true,$fn=res);
}
module body() {
	hull(){cube(cube_l,center=true);
	translate([cube_l/2+7,0,0])cylinder(r=7,h=cube_l,center=true,$fn=res);}
	translate([cube_l/2+7,0,cube_l/2+4])cylinder(r=7,h=cube_l/2-4,center=true,$fn=res);
}
	//Render
difference() {
	hull()scale(v=[1.1,1.1,1])cut();
	cut();
}