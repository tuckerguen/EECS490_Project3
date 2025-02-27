% Find majority value in matrix
function majority = mat_majority(A)
    counts = zeros(256,1);
    for i=1:size(A,1)
        for j=1:size(A,2)
            v = A(i,j)+1;
            counts(v) = counts(v)+1;
        end
    end
    majority = 0;
    maj_count = -1;
    for i=1:256
        if counts(i) > maj_count
            maj_count = counts(i);
            majority = i-1;
        end
    end