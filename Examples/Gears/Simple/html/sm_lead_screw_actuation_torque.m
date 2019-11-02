%% Lead Screw Actuation Torque
%  
% This example models a lead screw.  It is configured to run a kinematic
% simulation and calculate the actuation force required to achieve the
% specified motion for the lead screw.  A load force acts on the screw,
% increasing the amount of torque required to drive the lead screw
%
% Copyright 2014-2018 The MathWorks, Inc.


%% Model

open_system('sm_lead_screw_actuation_torque')

set_param(find_system('sm_lead_screw_actuation_torque','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_lead_screw_actuation_torque_mechanics_explorer_IMAGE.png>>

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the actuation torque of the lead screw.
%


sm_lead_screw_actuation_torque_plot1actuation;

%%

%clear all
close all
bdclose all
