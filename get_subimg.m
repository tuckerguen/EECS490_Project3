function subimg = get_subimg(img, x0, y0, width, height)
    subimg = zeros(width, height, size(img,3));
    for i=y0:y0+width-1
        for j=x0:x0+height-1
            subimg(i-y0+1, j-x0+1,:) = img(i, j,:);
        end
    end