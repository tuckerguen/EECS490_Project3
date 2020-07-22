% Scaled Spatial Moment
function sm = spatial_moments(F)
    F = invert_bin_image(F);
    F = to_binary(F);

    sm = zeros(10,1, 'double');

    ms = [0,1,0,2,1,0,3,2,1,0];
    ns = [0,0,1,0,1,2,0,1,2,3];
    
    J = size(F,1);
    K = size(F,2);
    
    % For all 1-3 order moments
    for i=1:10
        m = ms(i);
        n = ns(i);
        sum = 0;
        for j=1:J
            for k=1:K
                xj = j+0.5;
                yk = k+0.5;
                sum = sum + xj^m * yk^n * double(F(j,k));
            end
        end
        moment = sum / (J^m * K^n);
        sm(i) = moment;
    end
