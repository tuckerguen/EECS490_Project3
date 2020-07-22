function features = get_shape_features(char)   
    features = zeros(16,1,'double');
    % Area
    features(1) = area(char);
    % Perimeter
    features(2) = perim(char);
    % Euler Number
    features(3) = euler_num(char, 4);
    % Circularity
    features(4) = circularity(features(1), features(2));
    % Spatial Moments
    features(5:14) = spatial_moments(char);
    % Symmetry
    features(15) = symmetry(char);
    % Aspect Ratio
    features(16) = aspect_ratio(char);