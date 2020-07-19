function warped = diskwarp(img)
    height = size(img, 1);
    width = size(img, 2);
    
    warped = zeros(height, width, 'uint8');
    
    for v=1:height
        for u=1:width
            x = a0+a1*u+a2*v+a3*u*u+a4*u*v+a5*v*v;
            y = b0+b1*u+b2*v+b3*u*u+b4*u*v+b5*v*v;
            
            % do something with it
            
            warped(v,u) = img(y,x);
        end
    end
    
    
    