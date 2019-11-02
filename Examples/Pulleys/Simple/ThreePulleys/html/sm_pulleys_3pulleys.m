%% Three Connected Pulleys
% 
% This example shows three pulleys connected by a single cable. The pulley
% constraint blocks ensure that the rotation of the individual pulleys
% is synchronized, taking into account the pulley radii and wrap direction
% of the cable.
%
% Copyright 2018-2019 The MathWorks, Inc.


%% Model

open_system('sm_pulleys_3pulleys')

set_param(find_system('sm_pulleys_3pulleys','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Pulleys Subsystem
%
% <matlab:open_system('sm_pulleys_3pulleys');open_system('sm_pulleys_3pulleys/Pulleys','force'); Open Subsystem>

set_param('sm_pulleys_3pulleys/Pulleys','LinkStatus','none')
open_system('sm_pulleys_3pulleys/Pulleys','force')

%% Simulation Results from Simscape Logging
%%
%
% The plots below show the angle of each pulley and the torqure required to
% produce this motion
%


sm_pulleys_3pulleys_plot1qpulley;

%%

%clear all
close all
bdclose all
