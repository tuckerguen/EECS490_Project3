function p1b(img_name)
    img = readraw(img_name);
    warped = diskwarp(img);
    inv = undiskwarp(warped);
    project_showpair(warped, inv, img_name, "disk warped and un-disk warped");