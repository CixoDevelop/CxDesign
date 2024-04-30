include <../parts/mounting_hole.scad>
include <../parts/sizes.scad>

rounds = 5;
depth = 100;
height = 80;
weight = 50;

module mounting_angle_shape() {
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

module mounting_angle_object() {
    linear_extrude(height = weight) {
        mounting_angle_shape();
    }
}

module mounting_angle_wood_hole() {
    rotate([270, 0, 0]) {
        translate([0, 0, rounds * 2]) {
            mounting_hole(WOOD_SCREW, SCREWDRIVER);
        }
    }
}

module mounting_angle_wall_hole() {
    rotate([0, 90, 0]) {
        translate([0, 0, rounds * 2]) {
            mounting_hole(WALL_SCREW);
        }   
    }
}

module mounting_angle() {
    difference() {
        translate([0, 0, weight / -2]) {
            mounting_angle_object();
        }
       
        translate([rounds * 2, 0, weight / 2 - rounds * 2]) {
            mounting_angle_wood_hole();
        }

        translate([rounds * 2, 0, weight / -2 + rounds * 2]) {
            mounting_angle_wood_hole();
        }
        
        translate([depth / 2, 0, weight / 2 - rounds * 2]) {
            mounting_angle_wood_hole();
        }
        
        translate([depth / 2, 0, weight / -2 + rounds * 2]) {
            mounting_angle_wood_hole();
        }

        translate([depth - rounds * 2, 0, weight / 2 - rounds * 2]) {
            mounting_angle_wood_hole();
        }
        
        translate([depth - rounds * 2, 0, weight / -2 + rounds * 2]) {
            mounting_angle_wood_hole();
        }

        translate([0, rounds * 2 + WALL_SCREW, 0]) {
            mounting_angle_wall_hole();
        }

        translate([0, height - rounds * 2 - WALL_SCREW, 0]) {
            mounting_angle_wall_hole();
        }
    }   
}
