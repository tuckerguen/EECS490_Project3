function inverted = invert_bin_image(img)
    rows = size(img, 1);
    cols = size(img, 2);
    
    inverted = zeros(rows, cols, 'uint8');

    for k=1:rows
        for c=1:cols
            if img(k,c) == 0 
                inverted(k,c)= 255;
            else
                inverted(k,c)= 0;
            end
        end
    end