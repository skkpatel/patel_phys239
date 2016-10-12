% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/11/2016

% hw2_problem2.m is the program that generates answers to problem 2 of hw2
% Start radiative transfer problem at frequency nu_0 and expand in steps
% away.
% input: cloud density n, cloud depth D, specific intensity at s=0 I_nu_0, 
    % cross section sigma_nu, source function S_nu
% output: specific intensity at s=D I_nu_D
function [I_nu_D] = hw2_problem2(n, D, I_nu_0, sigma_nu, S_nu)
    
    ds = D/100; % step size
    
    dist_steps = zeros(1,101); % create array for steps through the cloud from 0 to D, and fill with for loop below
    I_nu = zeros(1,101); % create array for I_nu(s) through the cloud in steps
    I_nu(1) = I_nu_0;
    
    for step = 1:100; % fill in the array of steps and the array of intensities at those steps
        dist_steps(1,step+1) = step*ds;
        dI_nu = -n*sigma_nu*(I_nu(1,step)-S_nu)*ds;
        I_nu(1,step+1) = I_nu(1,step)+dI_nu;
    end ;
    
    I_nu_D = I_nu(1,101);
    
end

