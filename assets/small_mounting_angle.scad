include <../parts/mounting_hole.scad>
include <../parts/sizes.scad>

rounds = 5;
depth = 50;
height = 40;
weight = 50;

module small_mounting_angle_shape() {
    hull() {
        square([rounds, height]);
        square([depth, rounds]);
    
        translate([rounds, height - rounds]) {
            circle(r = rounds);
        }

        translate([depth - rounds, rounds]) {
            circle(r = rounds);
        }
    }
}

module small_mounting_angle_object() {
    linear_extrude(height = weight) {
        small_mounting_angle_shape();
    }
}

module small_mounting_angle_wood_hole() {
    rotate([270, 0, 0]) {
        translate([0, 0, rounds * 2]) {
            mounting_hole(WOOD_SCREW, SCREWDRIVER);
        }
    }
}

module small_mounting_angle_wall_hole() {
    rotate([0, 90, 0]) {
        translate([0, 0, rounds * 2]) {
            mounting_hole(WALL_SCREW);
        }   
    }
}

module small_mounting_angle() {
    difference() {
        translate([0, 0, weight / -2]) {
            small_mounting_angle_object();
        }
   
        translate([rounds * 2, 0, weight / 2 - rounds * 2]) {
            small_mounting_angle_wood_hole();
        }

        translate([rounds * 2, 0, weight / -2 + rounds * 2]) {
            small_mounting_angle_wood_hole();
        }
    
        translate([depth - rounds * 2, 0, weight / 2 - rounds * 2]) {
            small_mounting_angle_wood_hole();
        }
    
        translate([depth - rounds * 2, 0, weight / -2 + rounds * 2]) {
            small_mounting_angle_wood_hole();
        }

        translate([0, height / 2, 0]) {
            small_mounting_angle_wall_hole();
        }
    }   
}
