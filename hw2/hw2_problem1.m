% Sheena Patel
% Phys239: Radiative Processes in Astrophysics
% Created: 10/11/2016

% hw2_problem1.m is the program that generates answers to problem 1 of hw2
% What is the column density of the cloud in [cm^{-2}]? What would the
% cross section \sigma_nu have to be to have a total optical depth through
% the cloud of \tau?
% input: cloud density n, cloud depth D, optical depths tau
% output: column density col_dens, cross section cross_sec
function [col_dens, cross_sec] = hw2_problem1(n, D, tau)
    col_dens = calc_col_dens(n, D);
    %calc optical depths
    cross_sec = calc_cross_sec(n, D, tau);
end

% function: calc_col_dens
% purpose: calculate the column density of a cloud of uniform density
% input: cloud density n, cloud depth D
% output: column density col_dens
function [col_dens] = calc_col_dens(n, D)
    col_dens = n*D;
end

% function: calc_cross_sec
% purpose: calculate the cross section of a cloud
% input: cloud density n, cloud depth D, total optical depth tau
% output: cross section cross_sec
function [cross_sec] = calc_cross_sec(n, D, tau)
    cross_sec = tau/(n*D);
end







