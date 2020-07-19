function modified = geometric_modify(img, scl, rot, t)
    transform_mat = [ cosd(rot)*(1/scl) sind(rot) -t;
                      -sind(rot)*(1/scl) cosd(rot)*(1/scl) -t;
                      0 0 1];
                  
    