% MIMO Simulator Base Code
% Coded by Prof. Sang Won Choi on 2021/10/22

clear all; % Reset
clc; % Clear screen
format long e;
warning('off','MATLAB:singularMatrix');

% Parameter configuration
M = 2; % Number of Tx and Rx antennas
N_Iter = 1e3; % Number of iteration for simulation

SNR = -10:5:30; % Signal to Noise Ratio (SNR)
Modulation_Order = 2; %2: QPSK, 4: 16QAM, 6: 64QAM

% MIMO Receivers 
ZF_BER = ZF_Based_MIMO_Simulation(M, SNR, N_Iter, Modulation_Order);

MMSE_BER = MMSE_Based_MIMO_Simulation(M, SNR, N_Iter, Modulation_Order);

ZF_SIC_BER  = ZF_SIC_Based_MIMO_Simulation(M, SNR, N_Iter, Modulation_Order);

MMSE_SIC_BER  = MMSE_SIC_Based_MIMO_Simulation(M, SNR, N_Iter, Modulation_Order);

ML_BER  = ML_Based_MIMO_Simulation(M, SNR, N_Iter, Modulation_Order);

semilogy(SNR, ZF_BER, '-o', SNR, MMSE_BER, '-o', SNR, ZF_SIC_BER, '-o', SNR, MMSE_SIC_BER, '-o', SNR, ML_BER, '-o', 'Linewidth', 3);
grid on;
title('BER Performance of MIMO receivers');
legend('ZF', 'MMSE', 'ZF SIC', 'MMSE SIC', 'ML');
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');