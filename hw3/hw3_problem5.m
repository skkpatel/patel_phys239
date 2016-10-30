% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/29/2016

% hw3_problem5.m is the program that essentially does everything in hw3 for
    % various initial positions and velocities and finds the frequency of
    % peak power output
% input: time interval dt, number of time steps in path after 0 N_tsteps,
    % second charged particle charge in units of charge_el Z
% output: array of impact parameter (units of a_0) and peak power emission 
    % bP, array of initial velocities (units of a_0/s) and peak power 
    % emission vP
function [bP, vP] = hw3_problem5(dt, N_tsteps, Z)
    
    astro_constants;
    
    % Define constants or initial conditions important for this homework.
    x_0_a0 = -300; % initial x-position [Bohr radii] 
    x_0 = x_0_a0*radius_Bohr; % initial x-position [m]
    v_y_0 = 0; % initial y-velocity [m/s] 
    N_b = 400; % number of impact parameters to test
    b_min = 50; % minimum impact parameter to test (units of a0)
    b_max = 10000; % maximum impact parameter to test (units of a0)
    N_vi = 400; % number of initial velocities to test
    vi_min = power(10,4); % minimum initial velocity
    vi_max = power(10,5); % maximum initial velocity
    
    
    % Initialize bP and vP and maxpower arrays
    bP = zeros(2,N_b);
    vP = zeros(2,N_vi);
    db = (b_max-b_min)/(N_b-1);
    dvi = (vi_max-vi_min)/(N_vi-1);
    powers = zeros(1,N_b);
    
    % Let's work with varying impact parameter first. For this, we need to
        % specify the initial x-velocity. The impact parameter is
        % the y-position
    v_x_0 = 2*power(10,5); % initial x-velocity [m/s] 
    b = b_min;
    
    for i = 1:N_b
        
        [~, ~, ~, accels] = hw3_problem2(dt, N_tsteps, x_0, ...
            b*radius_Bohr, v_x_0, v_y_0, Z); % iterate through steps to get 
                                    % the electron's positions through time
        
        freqs = [1:(N_tsteps/2)]/(dt*N_tsteps);
        tempfft = abs(fft(accels(1,:)));
        accel_x_ft = tempfft(1:N_tsteps/2);
        tempfft = abs(fft(accels(2,:)));
        accel_y_ft = tempfft(1:N_tsteps/2);
        for iiii = 1:N_tsteps/2;
            powers(iiii) = (accel_x_ft(iiii)^2 + accel_y_ft(iiii)^2)^(0.5);
        end
        
        [~, maxpower_index] = max(powers); % find the index of the max power
        % Fill in bp
        bP(1,i) = b;
        bP(2,i) = freqs(maxpower_index);
        
                
        b = b + db;
        
    end
    
    
    
    % Next let's work with varying the initial velocities. For this, we
        % want to specify the initial y-position.
    y_0_a0 = 400; % initial y-position [Bohr radii] 
    y_0 = y_0_a0*radius_Bohr; % initial y-position [m]
    vi = vi_min;
    for ii = 1:N_b
        
        [~, ~, ~, accels] = hw3_problem2(dt, N_tsteps, x_0, ...
            y_0, vi, v_y_0, Z); % iterate through steps to get the 
                                    % electron's positions through time
        
        freqs = [1:(N_tsteps/2)]/(dt*N_tsteps);
        tempfft = abs(fft(accels(1,:)));
        accel_x_ft = tempfft(1:N_tsteps/2);
        tempfft = abs(fft(accels(2,:)));
        accel_y_ft = tempfft(1:N_tsteps/2);
        for iii = 1:N_tsteps/2;
            powers(iii) = (accel_x_ft(iii)^2 + accel_y_ft(iii)^2)^(0.5);
        end
        
        [~, maxpower_index] = max(powers); % find the index of the max power
        % Fill in bp
        vP(1,ii) = vi;
        vP(2,ii) = freqs(maxpower_index);
        
        vi = vi + dvi;
        
    end
    

  
    
end