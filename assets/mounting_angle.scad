include <../parts/mounting_hole.scad>
include <../parts/sizes.scad>

rounds = 5;
depth = 180;
height = 150;
weight = 65;
proportion = depth / height;
thickness = 10;
wall_mount_thickness = 20;

module mounting_angle_base_shape(smaller_x = 0, smaller_y = 0) {
    hull() {
        square([rounds, height - smaller_y]);
        square([depth - smaller_x, rounds]);
    
        translate([rounds, height - smaller_y - rounds]) {
            circle(r = rounds);
        }

        translate([depth - smaller_x - rounds, rounds]) {
            circle(r = rounds);
        }
    }
}

module mounting_angle_shape() {
    difference() {
        mounting_angle_base_shape();
        
        translate([wall_mount_thickness, thickness]) {
            mounting_angle_base_shape(
                proportion * wall_mount_thickness * 2, 
                wall_mount_thickness * 2
            );
        }
    }
}

module mounting_angle_object() {
    render() {
        linear_extrude(height = weight) {
            mounting_angle_shape();
        }
    }
}

module mounting_angle_wood_hole() {
    rotate([270, 0, 0]) {
        translate([0, 0, rounds * 2]) {
            mounting_hole(WOOD_SCREW, SCREWDRIVER, 1000);
        }
    }
}

module mounting_angle_wall_hole(position) {
    fix = proportion * WALL_SCREW * 3.1 / 2 - rounds;

    rotate([0, 90, 0]) {
        translate([0, 0, wall_mount_thickness]) {
            mounting_hole(WALL_SCREW, WALL_SCREW * 3.1, 1000);
        }   
    }
}

module mounting_angle() { 
    render() {
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

            first_wall_screw_height = rounds * 4 + WALL_SCREW;
            second_wall_screw_height = height - (rounds * 4 + WALL_SCREW);
            
            first_wall_screw_depth = 
                proportion * (height - first_wall_screw_height);
            
            second_wall_screw_depth = 
                proportion * (height - second_wall_screw_height);

            translate([0, first_wall_screw_height, 0]) {
                mounting_angle_wall_hole(first_wall_screw_depth);
            }

            translate([0, second_wall_screw_height, 0]) {
                mounting_angle_wall_hole(second_wall_screw_depth);
            }
        }   
    }
}
