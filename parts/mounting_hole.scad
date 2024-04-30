module mounting_hole(size, margin_size = 0, length = 100) {
    radius = size / 2;
    margin_radius = margin_size > 0 ? margin_size / 2 : radius * 2;
    sphere_radius = margin_radius > radius * 2 ? radius * 2 : margin_radius;

    scale([1, 1, 0.7]) {
        sphere(r = sphere_radius);
    }

    cylinder(r = margin_radius, h = length);

    translate([0, 0, -length]) {
        cylinder(r = radius, h = length);
    }
}
