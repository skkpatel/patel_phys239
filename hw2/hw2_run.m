% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/11/2016 on MatLab R2016A

% hw2_run.m is the script that generates the requested outputs for hw2 


% Load in astro constants and units
astro_constants;

% Define constants important for this homework
D = 100 * parsec; % m
n = power(10,6); % 1/m^3
S_nu = 0.5; % ????? some constant

% Complete problem 1 (run hw2_problem1 and print out results)
fprintf('\nProblem 1: \n\n');
tau1 = power(10,-3);
tau2 = power(10,0);
tau3 = power(10,3);
[col_dens, cross_sec1] = hw2_problem1(n, D, tau1);
[~, cross_sec2] = hw2_problem1(n, D, tau2);
[~, cross_sec3] = hw2_problem1(n, D, tau3);
fprintf(['The column density of our cloud with a uniform density of ', ...
    num2str(n/1000000), ' cm^{-3} \nand depth ', num2str(D/parsec), ' pc is ', ...
    num2str(col_dens/10000,'%.3g') , ' cm^{-2}.\n\n']);
fprintf(['If the cloud has a total optical depth of ', num2str(tau1), ...
    ', the cross section must be \n', num2str(cross_sec1/10000,'%.3g'), ...
    ' cm^{-2}.\n\n']);
fprintf(['If the cloud has a total optical depth of ', num2str(tau2), ...
    ', the cross section must be \n', num2str(cross_sec2/10000,'%.3g'), ...
    ' cm^{-2}.\n\n']);
fprintf(['If the cloud has a total optical depth of ', num2str(tau3), ...
    ', the cross section must be \n', num2str(cross_sec3/10000,'%.3g'), ...
    ' cm^{-2}.\n\n']);

% Problems 2 and 3
fprintf(['\nProblems 2 and 3 generate vectors of intensities through the ', ...
    'cloud and the \ncross section at various frequencies. \n\n']);
       % [I_nu_D] = hw2_problem2(n, D, I_nu_0, sigma_nu, S_nu);
       % [sigma_nu] = hw2_problem3(freqs, sigma_nu_0)

% Problem 4: put together the pieces for different scenarios

fprintf('\nProblem 4: see plots\n\n');
freqs = 0:100;

figure % new figure (this is where the scenarios will be plotted)
ax1 = subplot(3,2,1); 
ax2 = subplot(3,2,2); 
ax3 = subplot(3,2,3); 
ax4 = subplot(3,2,4); 
ax5 = subplot(3,2,5); 
ax6 = subplot(3,2,6); 

% Scenario 1d
tau_max_1d = 100;
I_nu_0_1d = 0;
I_nu_D_1d = hw2_problem4(n, D, I_nu_0_1d, freqs, tau_max_1d, S_nu);
plot(ax1, freqs, I_nu_D_1d, 'm', freqs, S_nu*ones(101), 'g--', freqs, I_nu_0_1d*ones(101), 'c--')
title(ax1, 'Scenario 1d')
xlim(ax1,[0,100])
ylim(ax1,[-0.05,1.05])

% Scenario 2c
tau_max_2c = 0.5;
I_nu_0_2c = 0;
I_nu_D_2c = hw2_problem4(n, D, I_nu_0_2c, freqs, tau_max_2c, S_nu);
plot(ax2, freqs, I_nu_D_2c, 'm', freqs, S_nu*ones(101), 'g--', freqs, I_nu_0_2c*ones(101),'c--')
title(ax2, 'Scenario 2c')
xlim(ax2,[0,100])
ylim(ax2,[-0.05,1.05])

% Scenario 3e
tau_max_3e = 0.8;
I_nu_0_3e = 0.1;
I_nu_D_3e = hw2_problem4(n, D, I_nu_0_3e, freqs, tau_max_3e, S_nu);
plot(ax3, freqs, I_nu_D_3e, 'm', freqs, S_nu*ones(101), 'g--', freqs, I_nu_0_3e*ones(101),'c--')
title(ax3, 'Scenario 3e')
xlim(ax3,[0,100])
ylim(ax3,[-0.05,1.05])

% Scenario 4b
tau_max_4b = 0.8;
I_nu_0_4b = 1;
I_nu_D_4b = hw2_problem4(n, D, I_nu_0_4b, freqs, tau_max_4b, S_nu);
plot(ax4, freqs, I_nu_D_4b, 'm', freqs, S_nu*ones(101), 'g--', freqs, I_nu_0_4b*ones(101),'c--')
title(ax4, 'Scenario 4b')
xlim(ax4,[0,100])
ylim(ax4,[-0.05,1.05])

% Scenario 5f
tau_max_5f = 5;
I_nu_0_5f = 0.1;
I_nu_D_5f = hw2_problem4(n, D, I_nu_0_5f, freqs, tau_max_5f, S_nu);
plot(ax5, freqs, I_nu_D_5f, 'm', freqs, S_nu*ones(101), 'g--', freqs, I_nu_0_5f*ones(101),'c--')
title(ax5, 'Scenario 5f')
xlim(ax5,[0,100])
ylim(ax5,[-0.05,1.05])
xlabel('nu')

% Scenario 6a
tau_max_6a = 5;
I_nu_0_6a = 1;
I_nu_D_6a = hw2_problem4(n, D, I_nu_0_6a, freqs, tau_max_6a, S_nu);
subplot6 = plot(ax6, freqs, I_nu_D_6a, 'm', freqs, S_nu*ones(101), 'g--', freqs, I_nu_0_6a*ones(101), 'c--');
title(ax6, 'Scenario 6a')
xlim(ax6,[0,100])
ylim(ax6,[-0.05,1.05])
xlabel('nu')
set (subplot6(1), 'Color', 'm')
set (subplot6(2), 'Color', 'g')
set (subplot6(3), 'Color', 'c')
warning('off','MATLAB:legend:IgnoringExtraEntries'); 
legend(subplot6, {'I_n_u(D)', 'S_n_u', 'I_n_u(0)'})
warning('on','MATLAB:legend:IgnoringExtraEntries'); 


