function val = match_bit_quads(char, primary_coeff, quad_ids, coeffs)
    h = size(char,1);
    w = size(char,2);
    
    % conv char to binary
    char = invert_bin_image(char);
    char = to_binary(char);
    
    quads_per_set = [1, 4, 4, 4, 1, 2];
    
    % Q0
    quads(:,:,1,1) = [0 0; 0 0];
    % Q1
    quads(:,:,2,1) = [1 0; 0 0];
    quads(:,:,2,2) = [0 1; 0 0];
    quads(:,:,2,3) = [0 0; 0 1];
    quads(:,:,2,4) = [0 0; 1 0];
    % Q2
    quads(:,:,3,1) = [1 1; 0 0];
    quads(:,:,3,2) = [0 1; 0 1];
    quads(:,:,3,3) = [0 0; 1 1];
    quads(:,:,3,4) = [1 0; 1 0];
    % Q3
    quads(:,:,4,1) = [1 1; 0 1];
    quads(:,:,4,2) = [0 1; 1 1];
    quads(:,:,4,3) = [1 0; 1 1];
    quads(:,:,4,4) = [1 1; 1 0];
    % Q4
    quads(:,:,5,1) = [1 1; 1 1];
    % QD
    quads(:,:,6,1) = [1 0; 0 1];
    quads(:,:,6,2) = [0 1; 1 0];
    
    val = 0;
    
    % For all bit quads in formula include
    for s=1:size(quad_ids,2)
        % Get bit quad set
        quad_id = quad_ids(s);
        quad_set = squeeze(quads(:,:,quad_id+1,:));
        % n value for quad set
        n = 0;
        % For each bit quad in bit quad set
        for q=1:quads_per_set(quad_id+1)
            % get quad
            quad = quad_set(:,:,q);
            % For each pixel in image
            for i=1:h-1
                for j=1:w-1
                    % Get 2x2 subimg to match on
                    subimg(1,1) = char(i,j);
                    subimg(1,2) = char(i,j+1);
                    subimg(2,1) = char(i+1,j);
                    subimg(2,2) = char(i+1,j+1);
                    % if quad matches
                    if match(subimg, quad)
                        n = n+1;
                    end
                end
            end
        end
        % increment and multiply by coeff for quad set
        val = val + n*coeffs(s);
    end
    
    % apply final primary coeff
    val = val * primary_coeff;
    
    function is_match = match(img, quad)
        is_match = true;
        for i=1:2
            for j=1:2
                if img(i,j) ~= quad(i,j)
                    is_match = false;
                end
            end
        end