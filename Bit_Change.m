% change s&r to bit code
function [bit] = Bit_Change(complex, M)
    for num1 = 1:M
        if real(complex(num1)) >= 0
            bit(num1, 1) = 0;
        else
            bit(num1, 1) = 1;
        end

        if imag(complex(num1)) >= 0
            bit(num1, 2) = 0;
        else
            bit(num1, 2) = 1;
        end
    end