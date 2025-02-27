function p2(img_name, k, W)
    img = readraw(img_name);
    % Law's filter
    features = laws_feature_extract(img, W);
    
    % Run kmeans to classify each pixel
    idx = kmeans(double(features), k);
    
    % Remap pixels to segmented image
    h = size(img,1);
    w = size(img,2);

    segmented = zeros(h,w,'uint8');
    color_inc = 255 / (k-1);
    for i=1:size(idx)
        x = (ceil(i/h))+1;
        y =(mod(i,h));
         if y == 0
            y = h;
         end
        segmented(y,x) = (idx(i)-1)*color_inc;   
    end

    final = cleanup_segmentation(segmented, 25);
    
    project_showpair(segmented, final, img_name, "cleaned");
    project_showpair(img, segmented, img_name, "segmented");
    
    out_filename = "Images/OUT_p2_segmented" + ...
        extractBetween(img_name, 8, strlength(img_name));
    writeraw(segmented, out_filename);
    
    out_filename = "Images/OUT_p2_cleaned" + ...
        extractBetween(img_name, 8, strlength(img_name));
    writeraw(final, out_filename);

 