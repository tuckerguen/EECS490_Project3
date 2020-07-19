function scaled = scale(img, scl)
    height = size(img, 1);
    width = size(img, 2);

    scaled = zeros(height, width, 'uint8');   
    
    ty = (height+1)/2;
    tx = (width+1)/2;

    for v=1:height
        for u=1:width
            % Translate point to put center at origin
            % and compute reverse address
            x = (u-tx+0.5)/scl - 0.5 + tx;
            y = (v-ty+0.5)/scl - 0.5 + ty;
            
            % Interpolate
            interp_val = bilinear_interp(img, x,y);
            
            % Check bounds 
            if x > 0 && x <= width && y > 0 && y <= height
                scaled(v,u) = interp_val;
            end
        end
    end