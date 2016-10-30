% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/29/2016

% hw3_problem2.m is the program that generates answers to problem 2 of hw3
% Iterate the motion of the electron 
% input: time interval dt, number of time steps in path after 0 N_steps,
    % initial x-position x_0, initial y-position y_0, initial x-velocity
    % v_x_0, initial y-velocity v_y_0, second charged particle charge in 
    % units of charge_el Z
% output: arrays of times (times) and positions (positions) and velocities 
    % (velocities) and accelerations (accels) with x-values in first row
    % and y-values in second row
function [times, positions, velocities, accels] = hw3_problem2(dt, N_tsteps,...
    x_0, y_0, v_x_0, v_y_0, Z)
    
    astro_constants;
    
    % creates arrays of the correct size for times, positions, velocities,
    % accels but fills in zeros for now
    times = zeros(1,N_tsteps+1); 
    positions = zeros(2,N_tsteps+1); 
    velocities = zeros(2,N_tsteps+1); 
    accels = zeros(2,N_tsteps+1); 
    
    % fill in times
    for step = 1:(N_tsteps+1)
        times(step) = dt*(step-1);
    end
    
    % fill in initial conditions
    positions(1,1) = x_0;
    positions(2,1) = y_0;
    velocities(1,1) = v_x_0;
    velocities(2,1) = v_y_0;
    separation = (x_0^2 + y_0^2)^0.5;
    accel = (k_e*(charge_el^2)*Z)/(mass_el*(separation^2));
    accels(1,1) = -accel*x_0/separation;
    accels(2,1) = -accel*y_0/separation;
    
    % iterate through time interval steps
    for step = 1:N_tsteps;
        
        % calculate acceleration over interval based on positions at previous step
        separation = ((positions(1,step)^2) + (positions(2, step)^2))^0.5;
        accel = (k_e*power(charge_el,2)*Z)/(mass_el*separation^2);
        accels(1,step+1) = -accel*positions(1,step)/separation;
        accels(2,step+1) = -accel*positions(2,step)/separation;
        
        % calculate velocities based on accelerations assuming constant
        % acceleration for time interval
        velocities(1,step+1) = velocities(1,step) + accels(1,step+1)*dt;
        velocities(2,step+1) = velocities(2,step) + accels(2,step+1)*dt;
        
        % calculate positions based on velocities assuming constant
        % velocity for time interval
        positions(1,step+1) = positions(1,step) + velocities(1,step+1)*dt;
        positions(2,step+1) = positions(2,step) + velocities(2,step+1)*dt;
        
    end;
    
    
end