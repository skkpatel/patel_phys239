% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/11/2016

% hw2_problem4.m is the program that generates specific intensity as a 
    % function of frequency
% input: cloud density n, cloud depth D, vector of frequencies freqs,
    % specific intensity at s=0 I_nu_0
    % cross section maximum sigma_nu_0, constant source function S_nu
% output: vector of cross sections at frequencies in freqs
function [I_nu_D] = hw2_problem4(n, D, I_nu_0, freqs, sigma_nu_max, S_nu)
    
    sigma_nu = hw2_problem3(n, D, freqs, sigma_nu_max);
    I_nu_D = 0:100;
    for step = 1:101; % find I_nu(D) at different frequencies
        I_nu_D(step) = hw2_problem2(n, D, I_nu_0, sigma_nu(step), S_nu);
    end ;
    
end


% % function: 
% % purpose: 
% % input: 
% % output: 
% function [] = _()
%     
% end