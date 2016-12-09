% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 12/7/2016 on MatLab R2016A

% hw4_run.m is the script that generates the requested outputs for hw4 


% Load in astro constants and units
astro_constants;

% Define constants or initial conditions important for this homework.
% To change variables/initial conditions, change the lines ending in **
dataloc = 'm82spec.dat'; % loc\name of M82 data **
d_M82 = 3.6*power(10,6)*parsec*light_year; % distance to M82 in m

% Problem 1, import M82 data
% column 1: wavelength [um]
% column 2: monochromatic luminosity [L_sun/Hz]
% column 3: uncertainty [L_sun/Hz]
m82struct = importdata(dataloc); % puts headers in m82struct.textdata and numbers in m82struct.data
m82data = m82struct.data;
% fig = figure(1);
% errorbar(m82data(:,1), m82data(:,2), m82data(:,3), 'b-o');
% xlabel('Wavelength [um]')
% ylabel('L_{nu} [L_{sun}/Hz]')
% ax = get(fig, 'CurrentAxes');
% set(ax, 'XScale', 'log', 'YScale', 'log')

% Problem 2a, stellar spectrum
stellar_spec = importdata('stellarspectrum.dat');
col_wavelength = stellar_spec.data(:,1)*power(10,-4);
col_500Myr = stellar_spec.data(:,33)/(10^6);
stellar_spec_data = [col_wavelength, col_500Myr];
% fig = figure(2);
% plot(stellar_spec_data(:,1), stellar_spec_data(:,2), 'r-o');
% xlabel('Wavelength [um]')
% ylabel('Log(L_{nu}) [L_{sun}/Hz]')
% ax = get(fig, 'CurrentAxes');
% set(ax, 'XScale', 'log', 'YScale', 'log')

% Problem 2b, dust
lambda_dust = 10:10:1000;
L_nu_dust = hw4_dust(lambda_dust,50,10^14);
% fig = figure(3);
% plot(lambda_dust, L_nu_dust);
% xlabel('Wavelength [um]')
% ylabel('L_{nu} [L_{sun}/Hz]')
% ax = get(fig, 'CurrentAxes');
% set(ax, 'XScale', 'log', 'YScale', 'log')

% Problem 2c, synchrotron
lambda_synch = 10:10:100000;
L_nu_synch = hw4_synch(lambda_synch,.01,2.5);
% fig = figure(4);
% plot(?,?);
% xlabel('Wavelength [um]')
% ylabel('L_{nu} [L_{sun}/Hz]')
% ax = get(fig, 'CurrentAxes');
% set(ax, 'XScale', 'log', 'YScale', 'log')

% Problem 2d, free-free emission
lambda_brem = 0.5:1:10000;
L_nu_brem = hw4_brem(lambda_brem,100,.0001);
% fig = figure(4);
% plot(lambda_brem,L_nu_brem);
% xlabel('Wavelength [um]')
% ylabel('L_{nu) [L_{sun}/Hz]')
% ax = get(fig, 'CurrentAxes');
% set(ax, 'XScale', 'log', 'YScale', 'log')






% Problem 3, plot everything
fig = figure(6);
plot(m82data(:,1), m82data(:,2), stellar_spec_data(:,1), stellar_spec_data(:,2), lambda_dust, L_nu_dust, lambda_synch, L_nu_synch, lambda_brem, L_nu_brem)
xlabel('Wavelength [um]')
ylabel('L_{nu} [L_{sun}/Hz]')
ax = get(fig, 'CurrentAxes');
set(ax, 'XScale', 'log', 'YScale', 'log')
legend('M82', 'starlight', 'dust emission', 'synchrotron', 'thermal free-free emission', 'Location', 'southwest')

