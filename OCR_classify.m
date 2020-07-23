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

    data = zeros(17,12, 'double');

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
            imshow(char);
            c = c+1;
            % Classify
            features = get_shape_features(char);
            data(:,tc) = features;
%             text_chars(tc) = decision_tree_classify(features);
            tc = tc+1;
        end
    end
    save('OCR_data.mat', 'data');


    function cropped = crop(img)
        h = size(img,1);
        w = size(img,2);
        cropped = img;
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
        cropped = cropped(um-1:dm+1,lm-2:rm+1);
    

    function white = is_white_row(img,r)
        white = true;
        for c=1:size(img,1)
            if img(r,c) == 0
                white = false;
            end
        end
        
    function white = is_white_col(img,c, prev_row, max_row)
        white = true;
        for r=prev_row:max_row
            if img(r,c) == 0
                white = false;
            end
        end