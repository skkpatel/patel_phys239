% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 12/8/2016

% hw4_dust.m is the program that generates spectrum for dust emission for
% hw 4
function [L_nu_dust] = hw4_dust(lambda_dust,T,C)

    astro_constants;
    
    B_nu = zeros(1,length(lambda_dust));

    for step = 1:(length(lambda_dust))
        B_nu(step) = 2*hPlanck*(v_light*v_light)/(lambda_dust(step)^5*(exp(hPlanck*v_light/(lambda_dust(step)*k_B*T))-1)); % Blackbody spectrum
    end

    L_nu_dust = C*B_nu;
    
end
