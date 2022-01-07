    function [ZF_BER] = ZF_Based_MIMO_Simulation(M, SNR, N_Iter, Modulation_Order)

%Transmit signal (symbol depending on modulation order)
if Modulation_Order == 2
    s = Antenna_Map(M, Modulation_Order);
   
elseif Modulation_Order == 4
    % s1~s16 per antenna
else
    % s1~s64 per antenna
end

ZF_BER_num = zeros((2^Modulation_Order)^(M-1), 9);
for num00 = 1:(2^Modulation_Order)^(M-1)
    s_num = s(:, num00);
    
    % change s to bit code
    s_bit = Bit_Change(s_num, M);

    for num0=1:9 % size(SNR) = (1,9)
        error_cnt(num0) = 0;
        scaling_factor = sqrt(10^(-SNR(num0)/20)); % ISSUE#1: Consider why this scailing factor is needed.
    
        for num1=1:N_Iter
            H = (1/sqrt(2))*randn(M,M) + i*(1/sqrt(2))*randn(M,M);
            n  = scaling_factor*((1/sqrt(2))*randn(M,1) + i*(1/sqrt(2))*randn(M,1));
            r  = H*s_num + n;

            post_processed_r = (inv(H'*H))*H'*r;

            % change r to bit code
            r_bit = Bit_Change(post_processed_r, M);

            % Error counting per antenna
            for num2 = 1:2*M
                if s_bit(num2) == r_bit(num2)
                    ;
                else
                    error_cnt(num0) = error_cnt(num0) + 1;
                end
            end
        end
        ZF_BER_num(num00, num0) = error_cnt(num0)/(N_Iter*M*2);
    end
end
ZF_BER = sum(ZF_BER_num) / (2^Modulation_Order)^(M-1);