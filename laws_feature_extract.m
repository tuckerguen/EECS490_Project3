function features = laws_feature_extract(img, W)
    % Define all laws filters
    laws(:,:,1) = [ 1/36 1/18 1/36;
                    1/18  1/9 1/18;
                    1/36 1/18 1/36 ];
    laws(:,:,2) = [ 1/12 0  -1/12;
                     1/6 0   -1/6;
                    1/12 0  -1/12 ];
    laws(:,:,3) = [ -1/12 1/6 -1/12;
                     -1/6 1/3  -1/6;
                    -1/12 1/6 -1/12];
    laws(:,:,4) = [ -1/12 -1/6 -1/12;
                        0    0     0;
                     1/12  1/6  1/12];
    laws(:,:,5) = [  1/4 0 -1/4;
                       0 0    0;
                    -1/4 0  1/4];
    laws(:,:,6) = [ -1/4  1/2 -1/4;
                       0    0    0;
                     1/4 -1/2  1/4];
    laws(:,:,7) = [ -1/12 -1/6 -1/12;
                      1/6  1/3   1/6;
                    -1/12 -1/6 -1/12];
    laws(:,:,8) = [ -1/4 0  1/4;
                     1/2 0 -1/2;
                    -1/4 0  1/4];
    laws(:,:,9) = [  1/4 -1/2  1/4;
                    -1/2    1 -1/2;
                     1/4 -1/2  1/4];
   
          
    % A matrix of features where each row is a pixel
    % in the image and each column is the energy calculated
    % from each laws filter
    features = zeros(size(img,1) * size(img,2), 9, 'uint8');
    
    for i=1:9
        % apply laws filter
        M = convolve_double(img, laws(:,:,i));
        % Compute sliding window energy per-pixel (stddev)
        T = neighborhood_stddev1(img, M, W);
        % Convert stddev mat T to a vector feature (of energy)
        feature = to_vec(T);
        % store the feature 
        features(:,i) = feature;
    end
    
    function vec = to_vec(T)
        h = size(T,1);
        w = size(T,2);
        
        vec = zeros(h*w, 1);
        for i=1:h
            for j=1:w
                vec((i-1)*w+j) = T(i,j);
            end
        end
        
    
    