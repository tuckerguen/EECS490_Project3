function binary_img = to_binary(img)
    num_rows = size(img, 1);
    num_cols = size(img, 2);

    binary_img = zeros(num_rows, num_cols, 'uint8');

    for i=1:num_rows
        for j=1:num_cols
            binary_img(i,j) = floor(img(i,j)/255);
        end
    end