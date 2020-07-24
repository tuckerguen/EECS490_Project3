function subimg = get_subimg_checkbounds(img, x0, y0, width, height)
    subimg = zeros(width, height, 'uint8');
    for i=y0:y0+width-1
        for j=x0:x0+height-1
            if i > 0 && i <= 256 ...
               && j > 0 && j <= 256    
                subimg(i-y0+1, j-x0+1) = img(i, j);
            end
        end
    end