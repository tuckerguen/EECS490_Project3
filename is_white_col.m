 function white = is_white_col(img,c, prev_row, max_row)
    white = true;
    for r=prev_row:max_row
        if img(r,c) == 0
            white = false;
        end
    end