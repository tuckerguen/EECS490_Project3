function warped = diskwarp(img, ox, oy, wx, wy)
    height = size(img, 1);
    width = size(img, 2);
    
    warped = zeros(height, width, 'uint8');
    
    num_ctrl_pts = size(ox,1);
    num_coeff = 6;
    

    % Define Matrix A
    A = zeros(num_ctrl_pts, 6);
    for i=1:num_ctrl_pts
        x = wx(i);
        y = wy(i);
        A(i,1) = 1; 
        A(i,2) = x;
        A(i,3) = y;
        A(i,4) = x^2;
        A(i,5) = x*y;
        A(i,6) = y^2;
        A(i,7) = x^3;
        A(i,8) = x^2*y;
        A(i,9) = x*y^2;
        A(i,10) = y^3;
    end

    % Inverse(A)*u, Inverse(A)*v
    if num_ctrl_pts == num_coeff
        a = A\ox;
        b = A\oy;
    else
        A_inv = (A'*A)\A';
        a = A_inv * ox;
        b = A_inv * oy;
    end

    for v=1:height
        for u=1:width
            % Compute reverse address mapping
            x = a(1)+a(2)*u+a(3)*v+a(4)*u^2+a(5)*u*v+a(6)*v^2 ...
               + a(7)*u^3+a(8)*u^2*v+a(9)*u*v^2+a(10)*v^3; ...
            y = b(1)+b(2)*u+b(3)*v+b(4)*u^2+b(5)*u*v+b(6)*v^2 ...
                +b(7)*u^3+b(8)*u^2*v+b(9)*u*v^2+b(10)*v^3; ...

            % Interpolate 
            interp_val = bilinear_interp(img, x, y);
            % Map the values 
            warped(v,u) = interp_val;
        end
    end 