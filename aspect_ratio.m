function ar = aspect_ratio(img)
    h = size(img,1);
    w = size(img,2);
    img = invert_bin_image(img);
    img = to_binary(img);
    % right, left, up, down most pixels
    rm = 0;
    lm = w+1;
    um = h+1;
    dm = 0;
    
    for i=1:h
        for j=1:w
            % is an object pixel
            if img(i,j) == 1
                if i < um
                    um = i;
                elseif i > dm
                    dm = i;
                elseif j < lm
                    lm = j-1;
                elseif j > rm
                    rm = j;
                end
            end
        end
    end
    
    objw = double(rm - lm);
    objh = double(dm - um);
    
    ar = objw/objh;