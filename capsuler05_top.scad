//Variabels
res=100;

gum_h=2;
gum_r=18/2;

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
	cylinder(r=screw_r,h=10,center=true,$fn=res);
	translate([0,0,7.5])cylinder(r1=screw_r,r2=screw_r*1.2,h=5,center=true,$fn=res);
}
module gum() {
	cylinder(r=gum_r,h=gum_h,center=true,$fn=res);
}
module cut() {
	translate([0,0,-cube_l/2+gum_h/2])gum();
	translate([0,0,-cube_l/2+(capsule_rest-4)-1])cylinder(r=capsule_top,h=capsule_rest+4,center=true,$fn=res);
	translate([0,0,5])screw_hole();
	scale(v=[1,1,1.2])rotate(a=[180,0,0]){rotate(a=[0,90,0])rotate(a=[0,0,45])translate([0,0,h1/2+1])cube([d1,d1,h1],center=true);
}

}
module body() {
	translate([0,0,-5])cylinder(r=capsule_bottom/2+margin,h=30-10,center=true,$fn=res);
	intersection() {
		translate([0,0,5])scale(v=[2,2,1.15])sphere(r=capsule_bottom/2+margin,$fn=res);
		cylinder(r=capsule_bottom/2+margin,h=30,center=true,$fn=res);
	}
}
	//Render
difference() {
	body();
	cut();
}