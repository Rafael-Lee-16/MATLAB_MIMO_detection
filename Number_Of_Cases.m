function [s_NoC] = Number_Of_Cases(M, Modulation_Order)
% s1이 fix 되어 있지 않은 s의 경우의 수 생성
% or ML에서 비교할 s의 경우의 수 생성

s_anchor = (1/sqrt(2))*Modulation_map(Modulation_Order);
antenna_num =  Modulation_Order*Modulation_Order;

s_NoC = zeros(M, (2^Modulation_Order)^M);
    
if M == 2
    for num1 = 1:antenna_num
        for num2 = 1:antenna_num
            s_NoC(2, num2 + antenna_num*(num1-1)) = s_anchor(num2);
            s_NoC(1, num2 + antenna_num*(num1-1)) = s_anchor(num1);
        end
    end

elseif M == 4
     for num1 = 1:antenna_num
         for num2 = 1:antenna_num
             for num3 = 1: antenna_num
                 for num4 = 1: antenna_num
                    s_NoC(4, num4 + antenna_num*(num3-1) + (antenna_num^2)*(num2-1) + (antenna_num^3)*(num1-1)) = s_anchor(num4);
                    s_NoC(3, num4 + antenna_num*(num3-1) + (antenna_num^2)*(num2-1) + (antenna_num^3)*(num1-1)) = s_anchor(num3);
                    s_NoC(2, num4 + antenna_num*(num3-1) + (antenna_num^2)*(num2-1) + (antenna_num^3)*(num1-1)) = s_anchor(num2);
                    s_NoC(1, num4 + antenna_num*(num3-1) + (antenna_num^2)*(num2-1) + (antenna_num^3)*(num1-1)) = s_anchor(num1);
                 end
             end
         end
     end

elseif M == 8
    for num1 = 1:antenna_num
         for num2 = 1:antenna_num
             for num3 = 1: antenna_num
                 for num4 = 1:antenna_num
                    for num5 = 1:antenna_num
                        for num6 = 1: antenna_num
                            for num7 = 1: antenna_num
                                for num8 = 1: antenna_num
                                    s_NoC(8, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num8);
                                    s_NoC(7, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num7);
                                    s_NoC(6, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num6);
                                    s_NoC(5, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num5);
                                    s_NoC(4, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num4);
                                    s_NoC(3, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num3);
                                    s_NoC(2, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num2);
                                    s_NoC(1, num8 + antenna_num*(num7-1) + (antenna_num^2)*(num6-1) + (antenna_num^3)*(num5-1) + (antenna_num^4)*(num4-1) + (antenna_num^5)*(num3-1) + (antenna_num^6 )*(num2-1) + (antenna_num^7 )*(num1-1)) = s_anchor(num1);
                                end
                            end
                        end
                    end
                 end
             end
         end
     end
end