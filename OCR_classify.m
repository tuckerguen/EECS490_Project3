function text_chars = OCR_classify(img)
    h = size(img,1);
    w = size(img,2);
    
    % Split image by rows
    wri = 1;
    looking = true;
    for r=1:h
        if is_white_row(img, r) 
            if looking
                white_rows(wri) = r+1;
                wri = wri+1;
                looking = false;
            end
        else
            looking = true;
        end
    end
    
    % Split image by columns
    % For every white row
    for r=2:size(white_rows,2)
        looking = true;
        wci = 1;
        if r==1
            prev_row = 1;
        else
            prev_row = white_rows(r-1);
        end
        max_row = white_rows(r);
        % For every column
        for c=1:w
            if is_white_col(img, c, prev_row, max_row)
                if looking
                    white_cols(r,wci) = c+1;
                    wci = wci+1;
                    looking = false;
                end
            else
                looking = true;
            end
        end
    end

    data = zeros(17,6, 'double');

    tc = 1;
    for r=2:size(white_rows,2)
        c=2;
        while c <= size(white_cols,2) && white_cols(r,c) ~= 0 
            ymin = white_rows(r-1);
            ymax = white_rows(r); 
            xmin = white_cols(r,c-1);
            xmax = white_cols(r,c);

            char = img(ymin:ymax, xmin:xmax);
            char = crop(char);
            c = c+1;
            % Classify
            features = get_shape_features(char);
            text_chars(tc) = decision_tree_classify(features);
            tc = tc+1;
        end
    end