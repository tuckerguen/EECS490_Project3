function warped = diskwarp(img, ox, oy, wx, wy)
    height = size(img, 1);
    width = size(img, 2);
    
    warped = zeros(height, width, 'uint8');
           
%     for i=1:num_ctrl_pts
%         warped(wy(i), wx(i)) = 175;
%         warped(oy(i), ox(i)) = 255;
%         imshow(warped);
%     end
    
    num_coeff = 6;
    num_ctrl_pts = size(ox,1);
    % Define Matrix A
    A = zeros(num_ctrl_pts, 6);
    for i=1:num_ctrl_pts
        A(i,1) = 1; 
        A(i,2) = wx(i);
        A(i,3) = wy(i);
        A(i,4) = wx(i)*wx(i);
        A(i,5) = wx(i)*wy(i);
        A(i,6) = wy(i)*wy(i);
    end

    % Inverse(A)*u, Inverse(A)*v
    if num_ctrl_pts == num_coeff
        a = A\ox;
        b = A\oy;
    else
        A_inv = (A.'*A) * A.';
        a = A_inv * ox;
        b = A_inv * oy;
    end
    A_inv = (A.'*A) * A.';

    a = linsolve(A, ox);
    b = linsolve(A, oy);
    
    for v=1:height
        for u=1:width
            % Compute reverse address mapping
            x = a(1)+a(2)*u+a(3)*v+a(4)*u*u+a(5)*u*v+a(6)*v*v;
            y = b(1)+b(2)*u+b(3)*v+b(4)*u*u+b(5)*u*v+b(6)*v*v;
            % Interpolate 
            interp_val = bilinear_interp(img, x, y);
            % Map the values 
            warped(v,u) = interp_val;
        end
    end
    
    
    