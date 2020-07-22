function msqe = symmetry(img)
    h = size(img,1);
    w = size(img,2);
    img = invert_bin_image(img);
    img = to_binary(img);
    mirr = mirror(img);
    
    sum = 0;
    for i=1:h
        for j=1:w
            sum = sum + (double(img(i,j)) - double(mirr(i,j)))^2;
        end
    end
    msqe = sum /(h*w);

