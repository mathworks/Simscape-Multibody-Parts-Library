%% Worm Gear Constraints and CAD Parts
% 
% This example models a worm gear assembly. The worm and gear are STEP
% files exported from a CAD system.  Two Revolute Joints and a Worm Gear
% Constraint constrain the parts for the correct kinematic behavior.
%
% Copyright 2017-2025 The MathWorks, Inc.



%% Model

open_system('sm_worm_gear_constraints_CAD')

set_param(find_system('sm_worm_gear_constraints_CAD','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_worm_gear_constraints_CAD_mechanics_explorer_IMAGE.png>>

%% Worm Gear Assembly Constraints Subsystem
%
% The Worm Gear Constraint requires that the rest of the mechanism hold
% the two frames to which it is connected in alignment.  This subsystem has
% the necessary constraints and parameterized Rigid Transform to hold the
% frames in the right position and orientation.
%
% <matlab:open_system('sm_worm_gear_constraints_CAD');open_system('sm_worm_gear_constraints_CAD/Worm%20Gear%20Constraints','force'); Open Subsystem>

set_param('sm_worm_gear_constraints_CAD/Worm Gear Constraints','LinkStatus','none')
open_system('sm_worm_gear_constraints_CAD/Worm Gear Constraints','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the speeds of the two shafts connected by the worm
% gear assembly with worm direction set to Right-Hand.
%

sm_worm_gear_constraints_CAD_plot1speed;


%%

%clear all
close all
bdclose all
