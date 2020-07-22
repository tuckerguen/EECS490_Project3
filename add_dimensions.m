% rows = # rows to add to each side
% cols = # cols to add to each side
function output = add_dimensions(img, rows, cols, border_val)
    % Get the existing dimensions
    img_rows = size(img,1);
    img_cols = size(img,2);
    % Calculate the new dimensions
    new_rows = img_rows+2*rows;
    new_cols = img_cols+2*cols;
    
    output = zeros(new_rows, new_cols, class(img));
    
    %Set initial values
    for r=1:new_rows
        for c=1:new_cols
            output(r,c) = output(r,c) + border_val;
        end
    end
    
    for r=1:img_rows
        for c=1:img_cols
            % initialize the output image to be the input image
            % but centered with a black border
            output(r+rows,c+cols) = img(r,c);
        end
    end