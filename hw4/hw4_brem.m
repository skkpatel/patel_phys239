% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 12/8/2016

% hw4_brem.m is the program that generates spectrum for free-free emission for
% hw 4
function [L_nu_brem] = hw4_brem(lambda_brem,T,C)

    astro_constants;
    
    L_nu_brem = zeros(1,length(lambda_brem));

    for step3 = 1:(length(lambda_brem))
        L_nu_brem(step3) = C*exp(-hPlanck*v_light*10^4/(k_B*T*lambda_brem(step3)));
    end

    
end