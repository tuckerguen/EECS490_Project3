function T = neighborhood_stddev1(img, masked, W)
    height = size(img,1);
    width = size(img,2);
    
    % 2D matrix of energy per WxW window
    T = zeros(height, width, 'double');
    
    for i=1:height
        for j=1:width
            img_window = get_subimg_checkbounds(img, i, j, W, W);
            masked_window = get_subimg_checkbounds(masked, i, j, W, W);
            T(i,j) = mat_stddev(img_window, masked_window);
        end
    end
    
    function d = mat_stddev(F, M)
        sum = 0;
        for i=1:size(F,1)
            for j=1:size(F,2)
                Fv = double(F(i,j));
                Mv = double(M(i,j));
                sum = sum+(Fv-Mv)^2;
            end
        end
        d = (1/size(F,1))*sqrt(sum);
