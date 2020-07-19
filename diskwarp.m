function warped = diskwarp(img)
    height = size(img, 1);
    width = size(img, 2);
    
    warped = zeros(height, width, 'uint8');
    
    num_ctrl_pts = 6;
    
    % Define Observation Point (points in original image) Vectors
    % hand computed 6 evenly spaced around perimeter... easy enough
%     ox = [256; 512; 512; 256;   1;  1; 1];
%     oy = [  1;  86; 427; 512; 427; 86; 10];
    
    % Define Control Point (points in final image) Vectors
%     cx = zeros(num_coeff, 1);
%     cy = zeros(num_coeff, 1);
    
    % Sample n evenly distributed points in a circle around the image
    % n = # polynomial coefficients
%     big_dim = max(height, width);
%     r = big_dim / 2;
%     for i=1:num_coeff
%         
%         % Start at 0 degrees
%         deg = (i-1) * (360/num_coeff);
%         % Set computed point as control point 
%         cx(i) = floor(r*cosd(deg)) + big_dim/2 + 1;
%         cy(i) = floor(r*sind(deg)) + big_dim/2 + 1;
%     end
%     cx = [250;468;463;260;38;37;10];
%     cy = [42;134;366;444;362;144;20];

    ox = [1;251;512;512;256;1];
    oy = [1;1;1;512;512;512];
    
    cx = [79;251;442;415;256;91; ];
    cy = [103;1;91;415;512;427; ];

    % Define Matrix A
    A = zeros(num_ctrl_pts);
    for i=1:num_ctrl_pts
        A(i,1) = 1; 
        A(i,2) = cx(i);
        A(i,3) = cy(i);
        A(i,4) = cx(i)*cx(i);
        A(i,5) = cx(i)*cy(i);
        A(i,6) = cy(i)*cy(i);
    end
    
    % Inverse A*u, Inverse A*v
    a = A\ox;
    b = A\oy;
    
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
    
    
    