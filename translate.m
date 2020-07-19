function translated = translate(img, tx, ty)
    num_rows = size(img, 1);
    num_cols = size(img, 2);
    translated = zeros(num_rows, num_cols, 'uint8'); 

    for v=1:num_rows
        for u=1:num_cols
            x = u - tx;
            y = v - ty;
            
            % Check bounds 
            if x > 0 && y > 0 && x <= num_cols && y <= num_rows
                translated(v,u) = img(y,x);
            end
        end
    end