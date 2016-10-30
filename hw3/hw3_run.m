% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/29/2016 on MatLab R2016A

% hw3_run.m is the script that generates the requested outputs for hw3 


% Load in astro constants and units
astro_constants;

% Define constants or initial conditions important for this homework.
% To change variables/initla conditions, change the lines ending in **
Z = 1; % Assume the second charged particle is a proton **
x_0_a0 = -300; % initial x-position [Bohr radii] **
x_0 = x_0_a0*radius_Bohr; % initial x-position [m]
y_0_a0 = 400; % initial y-position [Bohr radii] **
y_0 = y_0_a0*radius_Bohr; % initial y-position [m]
v_x_0 = 2*power(10,5); % initial x-velocity [m/s] **
v_y_0 = 0; % initial y-velocity [m/s] **
N_tsteps = 10000; % number of time interval steps **
dt = power(10,-15); % time interval in each step **


% Problem 1, state assumptions
fprintf(['\nIn this problem we are simulating the interaction between an \n', ...
    'electron and a charge particle. I will assume here that the second \n', ...
    'charged particle is a proton (H+).\n\n']);
fprintf('\nProblem 1: \n\n');
fprintf(['I will assume that the electron is injected at position ', ...
    '(', num2str(x_0_a0), '*a_0,', num2str(y_0_a0), '*a_0) \nwith velocity ', ...
    '(', num2str(v_x_0), ',', num2str(v_y_0), ') m/s. I will also assume ', ...
    'that the second charged particle \nis at the origin and fixed during ', ...
    'the interaction.\n\n']);

% Problem 2, calculations of electron's position and acceleration
fprintf('\nProblems 2 and 3: \n\n');
[times, positions, velocities, accels] = hw3_problem2(dt, N_tsteps, x_0, ...
    y_0, v_x_0, v_y_0, Z); % iterate through steps to get the electron's
                        % positions through time
% convert to units of bohr radii
pos_a0 = positions/radius_Bohr;
vel_a0 = velocities/radius_Bohr;
accel_a0 = accels/radius_Bohr;

% Problem 3, Make plots
% position plot
figure(1)
plot(pos_a0(1,:), pos_a0(2,:))
title('Electron Position')
xlabel('x-position [a_0]')
ylabel('y-position [a_0]')
% velocity plot
figure(2)
plot(vel_a0(1,:), vel_a0(2,:))
title('Electron Velocity')
xlabel('x-velocity [a_0/s]')
ylabel('y-velocity [a_0/s]')
% acceleration plot
figure(3)
plot(accel_a0(1,:), accel_a0(2,:))
title('Electron Acceleration')
xlabel('x-acceleration [a_0/s^2]')
ylabel('y-acceleration [a_0/s^2]')

fprintf('Figures 1-3\n\n');


% Problem 4, Fourier transform
fprintf('\nProblem 4: \n\n');
tempfft = abs(fft(accels(1,:)));
accel_x_ft = tempfft(1:N_tsteps/2);
tempfft = abs(fft(accels(2,:)));
accel_y_ft = tempfft(1:N_tsteps/2);
freqs = [1:(N_tsteps/2)]/(dt*N_tsteps);
for step = 1:N_tsteps/2
    power_ft(step) = (accel_x_ft(step)^2 + accel_y_ft(step)^2)^(0.5);
end

% Make plots
% accel_x
figure(4)
plot(freqs, accel_x_ft)
xlabel('Frequency [Hz]')
ylabel('Power_x [arb. units]')
% accel_y
figure(5)
plot(freqs, accel_y_ft)
xlabel('Frequency [Hz]')
ylabel('Power_y [arb. units]')
% power
figure(6)
plot(freqs, power_ft)
xlabel('Frequency [Hz]')
ylabel('Power [arb. units]')

fprintf('Figures 4-6\n\n');

% Problem 5: simulations to get peak power emission frequencies for various
% impact parameters or initial velocities
fprintf('\nProblem 5: \n\n');
[bP, vP] = hw3_problem5(dt, N_tsteps, Z);

% accel_y
figure(7)
plot(bP(1,:), bP(2,:))
xlabel('Impact Parameter [a_0]')
ylabel('Peak Power Frequency [Hz]')
title('Impact Parameter vs. Peak Power Frequency at initial velocity 2*10^5 m/s')
% power
figure(8)
plot(vP(1,:), vP(2,:))
xlabel('Initial Velocity [a_0/s]')
ylabel('Peak Power Frequency [Hz]')
title('Initial Velocity vs. Peak Power Frequency at impact parameter 400a_8')

fprintf('Figures 7-8\n\n');

