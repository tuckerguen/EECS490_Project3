function inverse = invert2x2(mat)
    inverse = zeros(2);
    det = mat(1,1)*mat(2,2) - mat(1,2)*mat(2,1);
    inverse(1,1) = mat(1,1)/det;
    inverse(1,2) = mat(1,2)/det;
    inverse(2,1) = mat(2,1)/det;
    inverse(2,2) = mat(2,2)/det;