function [s] = Antenna_Map(M, Modulation_Order)
%s1이 fix된 상태의 symbol 경우의 수 s 생성

s = zeros(M,4^(M-1));
s(1,:) = (1/sqrt(2))*(1+i);

s_anchor = (1/sqrt(2))*Modulation_map(Modulation_Order);
antenna_num =  Modulation_Order*Modulation_Order;

if M == 2
    for num0 = 1:antenna_num
        s(2, num0) = s_anchor(num0);
    end

elseif M == 4
     for num1 = 1:antenna_num
         for num2 = 1:antenna_num
             for num3 = 1: antenna_num
                    s(4, num3 + antenna_num*(num2-1) + (antenna_num^2)*(num1-1)) = s_anchor(num3);
                    s(3, num3 + antenna_num*(num2-1) + (antenna_num^2)*(num1-1)) = s_anchor(num2);
                    s(2, num3 + antenna_num*(num2-1) + (antenna_num^2)*(num1-1)) = s_anchor(num1);
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
                                s(8, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num7);
                                s(7, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num6);
                                s(6, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num5);
                                s(5, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num4);
                                s(4, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num3);
                                s(3, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num2);
                                s(2, num7 + antenna_num*(num6-1) + (antenna_num^2)*(num5-1) + (antenna_num^3)*(num4-1) + (antenna_num^4)*(num3-1) + (antenna_num^5)*(num2-1) + (antenna_num^6 )*(num1-1)) = s_anchor(num1);
                            end
                        end
                    end
                 end
             end
         end
     end
end

