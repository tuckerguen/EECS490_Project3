function white = is_white_row(img,r)
    white = true;
    for c=1:size(img,1)
        if img(r,c) == 0
            white = false;
        end
    end
        
   