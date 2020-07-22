function chars = segment_chars(img)    
    chars = zeros(80,65,12);
    % y_step=80, x_step=65
    chars(:,:,1)  = img(1:80,    1:65);
    chars(:,:,2)  = img(1:80,    60:124);
    chars(:,:,3)  = img(1:80,    125:189);
    chars(:,:,4)  = img(1:80,    192:256);
    chars(:,:,5)  = img(81:160,  1:65);
    chars(:,:,6)  = img(81:160,  60:124);
    chars(:,:,7)  = img(81:160,  125:189);
    chars(:,:,8)  = img(81:160,  192:256);
    chars(:,:,9)  = img(161:240, 1:65);
    chars(:,:,10) = img(161:240, 60:124);
    chars(:,:,11) = img(161:240, 125:189);
    chars(:,:,12) = img(161:240, 192:256);

%     h = size(img,1);
%     w = size(img,2);
%     
%     all_white = false;
%     
%     % Scan horizontally until black pixel
%     c = 1;
%     r = 1;
%     while img(r,c) == 255
%        c = c+1;
%        if c == w
%           c = 1;
%           r = r+1;
%        end
%     end
%     
%     % Scan horizontally until fully white column
%     while ~is_white(img, c)
%        c = c+1;
%     end
%     
%     function b = is_white(img,c)
%         b = true;
%         for r=1:size(img,1)
%             if img(r,c) == 0
%                 b = false;
%                 break;
%             end
%         end
%         