function p4a()
    close all;
    img = readraw_color("Images/cwru.raw");
    img = img(:,:,1);
    img = to_binary(img)*255;
    t1chars = OCR_classify(img);
    project_show(img, "Images/test1.raw", "Characters: " + t1chars);