function text_char = decision_tree_classify(f)
    if f(3) == -1
        text_char = '8';
    elseif f(3) == 0
        % 4,6,9,0
        if f(17) > 0.72
            text_char = '4';
        else
            if f(8) > 226
                text_char = '6'; 
            else
                if f(4) > 0.102
                    text_char = '0';
                else
                    text_char = '9';
                end
            end
        end
    elseif f(3) == 1 
        if f(4) > 0.4
           text_char = '.'; 
        else
           % 1,2,3,5,7
           if f(15) < 0.1
               text_char = '*';
           else
               if f(4) > 0.13
                   if f(1) < 390
                      text_char = '1'; 
                   else
                       text_char = '7'; 
                   end
               elseif f(4) < 0.107
                   text_char = '3'; 
               else
                    if f(15) < 0.38
                        text_char = '2'; 
                    else
                       text_char = '5';  
                    end
               end
           end
        end
    else
        data = matfile('OCR_data.mat').data;
        data_chars = ['1','2','3','4','5','6','7','8','9','0','*','.'];
        min = realmax;
        min_char = 0;
        for j=1:12
            dist = norm(f - data(:,j), 2);
            min = dist;
            min_char = j;
        end

        text_char = data_chars(min_char);
    end