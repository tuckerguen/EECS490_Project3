function p1b(img_name, disk)
    img = readraw(img_name);
    
    if disk
        [ox, oy, wx, wy] = get_control_points(img, true);
        warped = diskwarp(img, ox, oy, wx, wy);
        inv = diskwarp(img, wx, wy, ox, oy);
        project_showpair(warped, inv, img_name, "disk warped and un-disk warped");
        out_filename = "Images/OUT_p1b_warped_" + ...
                        extractBetween(img_name, 8, strlength(img_name));
        writeraw(warped, out_filename);
        out_filename = "Images/OUT_p1b_unwarped_" + ...
                        extractBetween(img_name, 8, strlength(img_name));
        writeraw(inv, out_filename);
    else
        warped = circle_warp(img);
        project_show(warped, img_name, "disk warped");
        out_filename = "Images/OUT_p1b_warped_" + ...
                        extractBetween(img_name, 8, strlength(img_name));
        writeraw(warped, out_filename);
    end