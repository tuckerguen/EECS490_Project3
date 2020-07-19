function interp_val = bilinear_interp(img, x, y)
    height = size(img, 1);
    width = size(img, 2);

    a = x - floor(x);
    b = y - floor(y);
    x = int16(floor(x));
    y = int16(floor(y));
    
    interp_val = 0;
    if x > 0 && x <= width-1 && y > 0 && y <= height-1
        interp_val = (1-b)*((1-a)*img(y,x)+a*img(y,x+1))...
            + b*((1-a)*img(y+1,x)+a*img(y+1,x+1));
    elseif x > 0 && x <= width && y > 0 && y <= width
        interp_val = img(y,x);
    end
    