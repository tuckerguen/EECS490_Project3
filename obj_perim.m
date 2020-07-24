function perim = obj_perim(obj)
    h = size(obj,1);
    w = size(obj,2);
    p = zeros(h,w,'uint8');
    perim = 0;
    for i=1:h
        for j=1:w
            if is_edge(obj,i,j)
                perim = perim+1;
                p(i,j) = 255;
            end
        end
    end

    
    function edge = is_edge(obj,i,j)
        height = size(obj,1);
        width = size(obj,2);
        
        v = obj(i,j);
        if i-1 < 1
            up = 255;
        else
            up = obj(i-1,j);    
        end
        
        if i+1 > height
            down = 255;
        else
            down = obj(i+1,j);
        end
        if j-1 < 1
           left = 255; 
        else
            left = obj(i,j-1);
        end
        if j+1 > width
            right = 255;
        else
            right = obj(i,j+1);
        end
        edge = v==0 && (up==255||down==255||left==255||right==255);

    