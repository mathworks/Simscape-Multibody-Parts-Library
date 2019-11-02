%% Worm Gear Assembly Testrig
% 
% This example models a worm gear assembly. The necessary blocks for a
% worm gear assembly are contained in a masked subsystem with the key
% parameters exposed in a dialog box.
%
% Copyright 2017 The MathWorks, Inc.



%% Model

open_system('sm_worm_gear_assembly_testrig')

set_param(find_system('sm_worm_gear_assembly_testrig','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_worm_gear_assembly_testrig_mechanics_explorer_IMAGE.png>>

%% Worm Gear Assembly Subsystem
%
% <matlab:open_system('sm_worm_gear_assembly_testrig');open_system('sm_worm_gear_assembly_testrig/Worm%20Gear%20Assembly','force'); Open Subsystem>

set_param('sm_worm_gear_assembly_testrig/Worm Gear Assembly','LinkStatus','none')
open_system('sm_worm_gear_assembly_testrig/Worm Gear Assembly','force')

%% Worm Gear Assembly Constraints Subsystem
%
% The Worm Gear Constraint requires that the rest of the mechanism hold
% the two frames to which it is connected in alignment.  This subsystem has
% the necessary constraints and parameterized Rigid Transform to hold the
% frames in the right position and orientation.
%
% <matlab:open_system('sm_worm_gear_assembly_testrig');open_system('sm_worm_gear_assembly_testrig/Worm%20Gear%20Assembly/Constraints','force'); Open Subsystem>

set_param('sm_worm_gear_assembly_testrig/Worm Gear Assembly/Constraints','LinkStatus','none')
open_system('sm_worm_gear_assembly_testrig/Worm Gear Assembly/Constraints','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the speeds of the two shafts connected by the worm
% gear assembly with worm direction set to Right-Hand.
%

set_param([bdroot '/Worm Gear Assembly'],'popup_worm_dir_asy','Right-Hand');
sim(bdroot);
sm_worm_gear_assembly_testrig_plot1speed;

%%
%
% The plot below shows the speeds of the two shafts connected by the worm
% gear assembly with worm direction set to Left-Hand.
%

set_param([bdroot '/Worm Gear Assembly'],'popup_worm_dir_asy','Left-Hand');
sim(bdroot);
sm_worm_gear_assembly_testrig_plot1speed;
%%

clear all
close all
bdclose all
