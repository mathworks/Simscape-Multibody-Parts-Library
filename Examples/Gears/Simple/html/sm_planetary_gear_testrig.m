%% Planetary Gear Testrig
%
% This example models a planetary gear with three planets. The planetary
% gear has three mechanical connections: sun gear, carrier, and ring gear.
% Driving and locking different pairs of shafts will produce different
% movements.
% 
% Copyright 2013-2017 The MathWorks, Inc.


%% Model

open_system('sm_planetary_gear_testrig')

set_param(find_system('sm_planetary_gear_testrig','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_planetary_gear_testrig_mechanics_explorer_IMAGE.png>>

%% Planetary Gear Subsystem
%
% This subsystem shows the parts, joints, and gear constraints used to
% model the planetary gear.
%
% <matlab:open_system('sm_planetary_gear_testrig');open_system('sm_planetary_gear_testrig/Planetary%20Gear','force'); Open Subsystem>

set_param('sm_planetary_gear_testrig/Planetary Gear','LinkStatus','none')
open_system('sm_planetary_gear_testrig/Planetary Gear','force')

%% Carrier Gear Subsystem
%
% This subsystem shows the used to model the carrier, which connects the planets.
%
% <matlab:open_system('sm_planetary_gear_testrig');open_system('sm_planetary_gear_testrig/Planetary%20Gear/Carrier%20Gear','force'); Open Subsystem>

set_param('sm_planetary_gear_testrig/Planetary Gear/Carrier Gear','LinkStatus','none')
open_system('sm_planetary_gear_testrig/Planetary Gear/Carrier Gear','force')

%% Sun Shaft Input Subsystem
%
% This subsystem models the input to each shaft.  Signals control the
% torque applied to the shaft and the enabling of a brake.
%
% <matlab:open_system('sm_planetary_gear_testrig');open_system('sm_planetary_gear_testrig/Sun%20Shaft%20Input','force'); Open Subsystem>

set_param('sm_planetary_gear_testrig/Sun Shaft Input','LinkStatus','none')
open_system('sm_planetary_gear_testrig/Sun Shaft Input','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the speeds of the three shafts attached to the
% planetary gear as different pairs of shafts are driven and locked.
%


sm_planetary_gear_testrig_plot1speed;

%%

clear all
close all
bdclose all
