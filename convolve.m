function output = convolve(img, mask)
    % Get dimensions of img and mask
    num_img_rows = size(img,1);
    num_img_cols = size(img,2);
    num_mask_rows = size(mask, 1);
    num_mask_cols = size(mask,2);
    
    % Compute the row and column offset from the corner 
    % of the mask to the center
    row_offset = floor(num_mask_rows/2);
    col_offset = floor(num_mask_cols/2);
    
    % Add 0's around the border of the image to allow for 
    % define convolutions at the edges
    expanded = add_dimensions(img, row_offset, col_offset, 0);
    
    % initialize the output image
    output = zeros(num_img_rows, num_img_cols, 'uint8');

    % Iterate over all pixels
    for y=2:num_img_rows+1
        for x=2:num_img_cols+1
            y0 = y-row_offset;
            x0 = x-col_offset;
            
            %Change this to not matlab-y form
            subimg = get_subimg(expanded, ...
                x0, y0, ...
                2*col_offset+1, 2*col_offset+1);
            
            val = apply_mask_to_subimg(subimg, mask);
            output(y-1,x-1) = val;
        end
    end

    function val = apply_mask_to_subimg(subimg, mask)
        mask_rows = size(mask, 1);
        mask_cols = size(mask,2);
        val = 0;
        
        for y1 = 1:mask_rows
            for x1 = 1:mask_cols
                val = val + mask(y1,x1)*subimg(y1,x1);
            end
        end
    
    