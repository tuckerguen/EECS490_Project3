    ox = zeros(num_ctrl_pts, 1);
    oy = zeros(num_ctrl_pts, 1);
    pps = (num_ctrl_pts/4);
    pt_inc = width / pps;
    
    bases = zeros(pps,1, 'int16');
    for i=1:pps
        bases(i) = (i-1) * pt_inc + 1;
    end
    
    for i=1:num_ctrl_pts
        % top
        if i <= pps
            ox(i) = bases(mod(i,pps));
            oy(i) = 1;
        % right
        elseif i > pps && i <= pps*2
            ox(i) = 512;
            oy(i) = bases(mod(i,pps));
        % bottom
        elseif i > pps*2 && i <= pps*3
            ox(i) = bases(i-mod(i,pps));
            oy(i) = 512;
        % left
        else
            ox(i) = 1;
            oy(i) = bases(i-mod(i,pps));
        end
    end
    