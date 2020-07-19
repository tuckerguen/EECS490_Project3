function project_showpair(img1, img2, img_name, desc)
    name = extractBetween(img_name, 8, strlength(img_name));
    figure('Name', name + " | " + desc, "NumberTitle", "off");
    imshowpair(img1, img2, 'montage');