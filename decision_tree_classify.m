function text_char = decision_tree_classify(f)
    if f(4) > 0.35
        text_char = '.';
    elseif f(4) > 0.17 && f(4) < 0.35
        text_char = '1';
    else 
        if f(3) == 1
            if f(11) < 50
                text_char = '*';
            else
                if f(9) < 180
                    text_char = '7';
                else
                    if f(1) > 517
                        text_char = '5';
                    else
                        if f(14) > 190
                            text_char = '3';
                        else
                            text_char = '2';
                        end
                    end
                end
            end
        elseif f(3) == 0
            if f(7) < 375
                text_char = '4';
            else
                if f(14) < 200
                    text_char = '6';
                else
                    if f(2) > 270
                        text_char = '9';
                    else
                        text_char = '0';
                    end
                end
            end
        elseif f(3) == -1
            text_char = '8';
        end
    end