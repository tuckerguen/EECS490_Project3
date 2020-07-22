function euler_num = euler_num(char, conn)
    if conn == 4
        euler_num = match_bit_quads(char, 0.25, [1,3,5], [1,-1,2]);
    elseif conn == 8
        euler_num = match_bit_quads(char, 0.25, [1,3,5], [1,-1,-2]);
    else
        DISP("Connectivity must be 4 or 8");
    end
%     euler_num = bweuler(char,4);