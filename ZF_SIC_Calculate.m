function [post_processed_r] = ZF_SIC_Calculate(M, H, s, n)
r  = H*s + n;
w = (inv(H'*H))*H';


if M==2
    post_processed_r(1, :) = w(1, :)*r;

    r2 = r - H(:, 1)*s(1);
    post_processed_r(2, :) = (H(:, 2)'*r2)/(H(:, 2)'*H(:, 2));

elseif M==4
    post_processed_r(1, :) = w(1, :)*r;

    r2 = r - H(:, 1)*s(1);
    H(:, 1) = [];
    w2 = (inv(H'*H))*H';
    post_processed_r(2, :) = w2(1, :)*r2;

    r3 = r2 - H(:, 1)*s(2);
    H(:, 1) = [];
    w3 = (inv(H'*H))*H';
    post_processed_r(3, :) = w3(1, :)*r3;

    r4 = r3 - H(:, 1)*s(3);
    post_processed_r(4, :) = (H(:, 2)'*r4)/(H(:, 2)'*H(:, 2));
    
elseif M==8
    post_processed_r(1, :) = w(1, :)*r;

    r2 = r - H(:, 1)*s(1);
    H(:, 1) = [];
    w2 = (inv(H'*H))*H';
    post_processed_r(2, :) = w2(1, :)*r2;

    r3 = r2 - H(:, 1)*s(2);
    H(:, 1) = [];
    w3 = (inv(H'*H))*H';
    post_processed_r(3, :) = w3(1, :)*r3;

    r4 = r3 - H(:, 1)*s(3);
    H(:, 1) = [];
    w4 = (inv(H'*H))*H';
    post_processed_r(4, :) = w4(1, :)*r4;

    r5 = r4 - H(:, 1)*s(4);
    H(:, 1) = [];
    w5 = (inv(H'*H))*H';
    post_processed_r(5, :) = w5(1, :)*r5;

    r6 = r5 - H(:, 1)*s(5);
    H(:, 1) = [];
    w6 = (inv(H'*H))*H';
    post_processed_r(6, :) = w6(1, :)*r6;

    r7 = r6 - H(:, 1)*s(6);
    H(:, 1) = [];
    w7 = (inv(H'*H))*H';
    post_processed_r(7, :) = w7(1, :)*r7;

    r8 = r7 - H(:, 1)*s(7);
    post_processed_r(8, :) = (H(:, 2)'*r8)/(H(:, 2)'*H(:, 2));
end