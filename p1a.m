function p1a(img_name, t)
    m = 2; theta = 5; s = 3;
    
    % Convert scale percent to decimal
    scl = 1-(s*t)/100;
    
    rot = theta*t;
    translation = m*t;
                         
    img = readraw(img_name);
    scaled = scale(img, scl);
    rotated = rotate(scaled, rot);
    final = translate(rotated, translation, translation);
    
    project_show(final, img_name, "special effect, t=" + t);
    
    out_filename = "Images/OUT_p1a_" + t + "_" + ...
        extractBetween(img_name, 8, strlength(img_name));
    writeraw(final, out_filename);