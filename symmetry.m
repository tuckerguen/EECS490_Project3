function score = symmetry(img)

    img = invert_bin_image(img);
    img = to_binary(img);
    
    xmirr = xmirror(img);
    ymirr = ymirror(img);
    
%     imshow(xmirr*255);
%     imshow(ymirr*255);
    
    score(1) = mean_sqerr(img, xmirr);
    score(2) = mean_sqerr(img, ymirr);

    function msqe = mean_sqerr(img, mirr)
        h = size(img,1);
        w = size(img,2);
        sum = 0;
        for i=1:h
            for j=1:w
                sum = sum + (double(img(i,j)) - double(mirr(i,j)))^2;
            end
        end
        msqe = sum /(h*w);