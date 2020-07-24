function warped = circle_warp(img)    
    height = size(img, 1);
    width = size(img, 2);
    
    warped = zeros(height, width, 'uint8');
    
    for v=1:height
        for u=1:width
            vn = (v-0.5-height/2)/height*2;
            un = (u-0.5-width/2)/width*2;
            x = vn*sqrt(1-un^2/2);
            y = un*sqrt(1-vn^2/2);
            x = x*height/2+height/2+1;
            y = y*width/2+width/2+1;
            interp = bilinear_interp(img, v, u);
            warped(int16(y), int16(x)) = interp;
        end
    end

    
%     for v=1:height
%         for u=1:width
%             un = (u-0.5-width/2)/width*2;
%             vn = (v-0.5-height/2)/height*2;
%             
%             x = un*sqrt(1-(un^2/2));
%             y = vn*sqrt(1-(vn^2/2));
% %             x = un/sqrt(1-(vn^2/2));
% %             y = vn/sqrt(1-(un^2/2));
% 
%             x = int16(x*height/2+height/2+1);
%             y = int16(y*width/2+width/2+1);
%             % Interpolate 
%             interp_val = bilinear_interp(img, u,v);
%             % Map the values 
%             warped(y,x) = interp_val;
%         end
%     end

