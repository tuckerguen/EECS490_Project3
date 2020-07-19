function project_show(img, img_name, desc)
    if extractBetween(img_name, 1, 7) == "Images/"
        img_name = extractBetween(img_name, 8, strlength(img_name));
    end
    figure('Name', img_name + " | " + desc, "NumberTitle", "off");
    imshow(img);