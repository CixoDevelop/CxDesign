module mounting_hole(size, margin_size = 0, length = 100) {
    radius = size / 2;
    margin_radius = margin_size > 0 ? margin_size / 2 : radius * 3.1;

    /* This 0.1 is used to fix strange view before render */

    translate([0, 0, -0.1]) {
        cylinder(r = margin_radius, h = length + 0.1);
    }

    translate([0, 0, -length]) {
        cylinder(r = radius, h = length);
    }
}
