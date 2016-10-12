% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/11/2016

% hw2_problem3.m is the program that generates answers to problem 2 of hw2
% Generate a cross section as a function of frequency 
% input: cloud density n, cloud depth D, vector of frequencies freqs, 
    % cross section maximum sigma_nu_max
% output: vector of cross sections at frequencies in freqs
function [sigma_nu] = hw2_problem3(n, D, freqs, tau_max)
    
    sigma_nu_max = tau_max/(n*D);
    nu_0 = (max(freqs)+min(freqs))/2; % spectral line center
    nu_stdev = (max(freqs)+min(freqs))/8;
    
    sigma_nu = sigma_nu_max*nu_stdev*sqrt(2*pi)*normpdf(freqs,nu_0,nu_stdev);
    
end

