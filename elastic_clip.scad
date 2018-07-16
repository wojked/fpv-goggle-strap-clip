CLIP_HEIGHT = 10;
CLIP_WALL_THICKNESS = 2.80;
CLIP_SIDE_WALL_THICKNESS = 3.0;

CLIP_MIDDLE_WALL = 2.5;
MIDDLE_FIN_HEIGHT = 0;

STRIP_THICKNESS = 3.0; // 2.2 without velcro
STRIP_WIDTH = 24;


HOLDER_OFFSET = 10;
HOLDER_THICKNESS = 4;
HOLDER_WIDTH = 25;

TOLERANCE = 0.2;

base();


module base(){
    clip_thickness = CLIP_WALL_THICKNESS*2 + CLIP_MIDDLE_WALL + STRIP_THICKNESS + HOLDER_THICKNESS;
    clip_width = CLIP_SIDE_WALL_THICKNESS*2 + STRIP_WIDTH;
    union(){
        difference(){
            translate([0,(STRIP_THICKNESS - HOLDER_THICKNESS)/2,0])
            cube([clip_width, clip_thickness,CLIP_HEIGHT], true);

            translate([0,STRIP_THICKNESS/2 + CLIP_MIDDLE_WALL/2,0])
            cube([STRIP_WIDTH,STRIP_THICKNESS,CLIP_HEIGHT*2], true);
            
            translate([0,-HOLDER_THICKNESS/2 - CLIP_MIDDLE_WALL/2,0])        
            cube([HOLDER_WIDTH + TOLERANCE, HOLDER_THICKNESS + TOLERANCE,CLIP_HEIGHT*2], true);
            
        };
        translate([0,0, (CLIP_HEIGHT + MIDDLE_FIN_HEIGHT)/2])
        cube([clip_width, CLIP_MIDDLE_WALL, MIDDLE_FIN_HEIGHT], true);        
    }  
}
