function area = obj_area(obj)
    h = size(obj,1);
    w = size(obj,2);

    area = 0;
    
    for i=1:h
        for j=1:w
            if obj(i,j) == 0
                area = area+1;
            end
        end
    end
