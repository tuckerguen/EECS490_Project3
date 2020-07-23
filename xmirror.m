function mirrored = xmirror(img)
    h = size(img,1);
    w = size(img,2);
    mirrored = zeros(h,w,'uint8');
    for i=1:h
        for j=1:w
            mirrored(i,j) = img(h-i+1,j);
        end
    end