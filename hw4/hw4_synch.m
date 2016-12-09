% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 12/8/2016

% hw4_synch.m is the program that generates spectrum for synchrotron emission for
% hw 4
function [L_nu_synch] = hw4_synch(lambda_synch,C,p)

    astro_constants;
    
    L_nu_synch = zeros(1,length(lambda_synch));

    for step2 = 1:(length(lambda_synch))
        L_nu_synch(step2) = C*(v_light/lambda_synch(step2))^(1/2-p/2);
    end

    
end