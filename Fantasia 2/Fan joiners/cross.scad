
module FanJoiner(screwRadius=3, screwSpread=60, height=2, width=10, fn=64)
{
    extra = screwRadius * 1.5;
    difference()
    {
        // Main cross shape
        union()
        {
            hull()
            {
                translate([0, -screwSpread - extra, 0]) cylinder(r=width/2, h=height, $fn=fn);
                translate([0,  screwSpread + extra, 0]) cylinder(r=width/2, h=height, $fn=fn);
            }

            hull()
            {
                translate([-screwSpread - extra, 0, 0]) cylinder(r=width/2, h=height, $fn=fn);
                translate([ screwSpread + extra, 0, 0]) cylinder(r=width/2, h=height, $fn=fn);
            }
        }

        // Screw holes
        translate([0, -screwSpread, -height]) cylinder(r=screwRadius, h=height*3, $fn=fn);
        translate([0,  screwSpread, -height]) cylinder(r=screwRadius, h=height*3, $fn=fn);
        translate([-screwSpread, 0, -height]) cylinder(r=screwRadius, h=height*3, $fn=fn);
        translate([ screwSpread, 0, -height]) cylinder(r=screwRadius, h=height*3, $fn=fn);

        // Slots for cable tie
        translate([0, -width/4, 0]) cube([width*0.7, 1, height*3], center=true);
        translate([0,  width/4, 0]) cube([width*0.7, 1, height*3], center=true);
    }
}

FanJoiner();
