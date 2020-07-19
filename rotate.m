function rotated = rotate(img, degrees)
    height = size(img, 1);
    width = size(img, 2);

    % Compute new size for rotated image to fit
    % Is this needed for the assignment?
    rot = mod(degrees, 180);
    if rot >= 90
        rot = rot - 90;
        new_rows = int16(width * cosd(rot) + height * sind(rot));
        new_cols = int16(width * sind(rot) + height * cosd(rot));
    else
        new_rows = int16(height * cosd(rot) + width * sind(rot));
        new_cols = int16(height * sind(rot) + width * cosd(rot));
    end

    rotated = zeros(new_rows, new_cols, 'uint8');   
    
    old_ty = (height+1)/2;
    old_tx = (width+1)/2;
    new_ty = (size(rotated, 1)+1)/2;
    new_tx = (size(rotated, 2)+1)/2;

    % Rotate clockwise
    degrees = 360 - degrees;
    % Compute inverse rotation matrix
    rot_mat =  invert2x2([ cosd(degrees) -sind(degrees);
                           sind(degrees)  cosd(degrees) ]);
   
    for v=1:new_rows
        for u=1:new_cols
            % Translate point to put center at origin
            x_in = double(u-new_tx);
            y_in = double(v-new_ty);
            
            % Apply matrix multiplication
            x = x_in*rot_mat(1,1)+y_in*rot_mat(1,2)+old_tx;
            y = x_in*rot_mat(2,1)+y_in*rot_mat(2,2)+old_ty;
            
            % Interpolate
            interp_val = bilinear_interp(img, x,y);
            
            % Check bounds 
            if x > 0 && x <= width && y > 0 && y <= height
                rotated(v,u) = interp_val;
            end
        end
    end
