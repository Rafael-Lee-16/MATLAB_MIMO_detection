function [s_anchor] = Modulation_map(Modulation_Order)

Modulation_num = 2^Modulation_Order;

real_range = -sqrt(Modulation_num) + 1 : 2 : sqrt(Modulation_num) - 1;
s_anchor = zeros(sqrt(Modulation_num));
img_range = flip(real_range);

for num0= 1:length(real_range)
    real = real_range(num0);
    for num1 = 1:length(real_range)
        img = img_range(num1);
        s_anchor(num1,num0) = real + 1i * img;
    end

end