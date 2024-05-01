include <../parts/sizes.scad>

width = 80;
depth = 50;
rounding = 5;
thickness = 3;

module connector_base_shape() {
    hull() {
        range_x = width / 2 - rounding;
        range_y = depth / 2- rounding;

        translate([range_x, range_y]) {
            circle(r = rounding);
        }

        translate([range_x, -range_y]) {
            circle(r = rounding);
        }

        translate([-range_x, range_y]) {
            circle(r = rounding);
        }

        translate([-range_x, -range_y]) {
            circle(r = rounding);
        }
    }
}

module connector_screw_hole(position_x, position_y) {
    translate([position_x, position_y]) {
        circle(r = SCREW_M2 / 2);
    }
}

module connector_shape() {
    range_x = width / 2;
    range_y = depth / 2;

    difference() {
        connector_base_shape();
   
        connector_screw_hole(range_x - rounding, range_y - rounding);
        connector_screw_hole(range_x - rounding, -(range_y - rounding));
        connector_screw_hole(-(range_x - rounding), range_y - rounding);
        connector_screw_hole(-(range_x - rounding), -(range_y - rounding));
        
        connector_screw_hole(rounding, range_y - rounding);
        connector_screw_hole(rounding, -(range_y - rounding));
     
        connector_screw_hole(-rounding, range_y - rounding);
        connector_screw_hole(-rounding, -(range_y - rounding));

        connector_screw_hole(range_x / 2, range_y - rounding * 2);
        connector_screw_hole(range_x / 2, -(range_y - rounding * 2));
     
        connector_screw_hole(-(range_x / 2), range_y - rounding * 2);
        connector_screw_hole(-(range_x / 2), -(range_y - rounding * 2));
    }
}

module connector_object() {
    linear_extrude(height = thickness) {
        connector_shape();
    }
}
