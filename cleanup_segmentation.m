function cleaned = cleanup_segmentation(img, W)
    h = size(img,1);
    w = size(img,2);
    cleaned = zeros(h,w,'uint8');
    
    img = add_dimensions(img, ceil(W/2), ceil(W/2), 0);
    
    for i=1:h
        for j=1:w
            subimg = get_subimg(img, i,j,W,W);
            m = mat_majority(subimg);
            cleaned(i,j) = m;
        end
    end

    % Find majority value in matrix
    function majority = mat_majority(A)
        counts = zeros(256,1);
        for i=1:size(A,1)
            for j=1:size(A,2)
                v = A(i,j)+1;
                counts(v) = counts(v)+1;
            end
        end
        majority = 0;
        maj_count = -1;
        for i=1:256
            if counts(i) > maj_count
                maj_count = counts(i);
                majority = i-1;
            end
        end