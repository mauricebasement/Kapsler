//Variabels
res=100*2 ;

gum_h=6;
gum_r=18/2;

output_r=7;

cube_l=30;

capsule_top=9/2;
capsule_bottom=18;
capsule_rest=16;

screw_r=1.4;

margin=3;

h1=cube_l/2+5;
d1=sqrt(capsule_top*capsule_top*2);
h2=10;
h3=capsule_top+margin/2;
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
	scale(v=[1,1,1.2])rotate(a=[180,0,0]){rotate(a=[0,90,0])rotate(a=[0,0,45])translate([0,0,h1/2+1])cube([d1,d1,h1],center=true);
}

}
module body() {
	cylinder(r=capsule_bottom/2+margin,h=30,center=true,$fn=res);
}
module complete() {
	rotate(a=[180,0,0])difference() {
		body();
		cut();
	}
}
module pipe() {
difference() {
scale(v=[1,1,1.2])rotate(a=[180,0,0]){rotate(a=[0,90,0])rotate(a=[0,0,45])translate([0,0,h2/2+capsule_top])cube([d1+margin/2,d1+margin/2,h2],center=true);}
scale(v=[1,1,1.2])rotate(a=[180,0,0]){rotate(a=[0,90,0])rotate(a=[0,0,45])translate([0,0,h2/2+capsule_top])cube([d1-margin/2,d1-margin/2,h2],center=true);}
}
}
module jet_b() {
	translate([0,0,-1.5])cylinder(r1=h3+1,r2=h3,h=2,center=true,$fn=res);
	cylinder(r=capsule_top,h=5,center=true,$fn=res);
}
module jet_c() {
	difference() {
		jet_b();
		cylinder(r=capsule_top-margin/2,h=5,center=true,$fn=res);
	}
}
module jet_a() {
	difference(){
		pipe();
		complete();
	}
}
module jet_d() {
	hull(){
		translate([20,0,0])rotate(a=[0,-90,0])jet_c();
		jet_e();
	}
}
module jet_e() {
	intersection() {
		translate([13,0,0])cube([1,20,20],center=true);
		jet_a();
	}
}
difference() {	union(){jet_d();translate([22,0,0])rotate(a=[0,-90,0])cylinder(r=h3+3,h=2,center=true,$fn=res);}
	translate([20,0,0])rotate(a=[0,-90,0])cylinder(r1=(capsule_top-margin/2)*2,r2=(capsule_top-margin/2),h=15.5,center=true,$fn=res);}
jet_a();