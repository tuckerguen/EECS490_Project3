function p1b(img_name)
    img = readraw(img_name);
    [ox, oy, wx, wy] = get_control_points(img);
    
    
    warped = diskwarp(img, ox, oy, wx, wy);
	
%     inv = undiskwarp(warped);
%     project_showpair(warped, inv, img_name, "disk warped and un-disk warped");
    imshow(warped);