%% Four-Sided Bevel Gear Assembly Testrig
% 
% This example models four bevel gears connected in a closed loop. The
% necessary blocks for a bevel gear assembly are contained in a masked
% subsystem with the key parameters exposed in a dialog box.
%
% Copyright 2017-2021 The MathWorks, Inc.


%% Model

open_system('sm_bevel_gear_4x_closed_assembly_testrig')

set_param(find_system('sm_bevel_gear_4x_closed_assembly_testrig','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_bevel_gear_4x_closed_assembly_testrig_mechanics_explorer_IMAGE.png>>

%% Bevel Gear 4x Closed Assembly Subsystem
%
% <matlab:open_system('sm_bevel_gear_4x_closed_assembly_testrig');open_system('sm_bevel_gear_4x_closed_assembly_testrig/Bevel%20Gear%204x%20Closed%20Assembly','force'); Open Subsystem>

set_param('sm_bevel_gear_4x_closed_assembly_testrig/Bevel Gear 4x Closed Assembly','LinkStatus','none')
open_system('sm_bevel_gear_4x_closed_assembly_testrig/Bevel Gear 4x Closed Assembly','force')

%% Bevel Gear 4x Closed Assembly Constraints Subsystem
%
% The Bevel Gear Constraint requires that the rest of the mechanism hold
% the two frames to which it is connected in alignment.  This subsystem has
% the necessary constraints and parameterized Rigid Transform to hold the
% frames in the right position and orientation.
%
% <matlab:open_system('sm_bevel_gear_4x_closed_assembly_testrig');open_system('sm_bevel_gear_4x_closed_assembly_testrig/Bevel%20Gear%204x%20Closed%20Assembly/Constraints','force'); Open Subsystem>

set_param('sm_bevel_gear_4x_closed_assembly_testrig/Bevel Gear 4x Closed Assembly/Constraints','LinkStatus','none')
open_system('sm_bevel_gear_4x_closed_assembly_testrig/Bevel Gear 4x Closed Assembly/Constraints','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the speeds of the four gears connected by the
% bevel gear assembly.
%

sm_bevel_gear_4x_closed_assembly_testrig_plot1speed;

%%

%clear all
close all
bdclose all
