%% Common Gear Assembly Testrig
% 
% This example models a pair of gears with parallel axes.  The assembly
% contains the two gears and all constraints required for the gear set.
% The assembly can be configured to model an external or internal gear set
% by adjusting parameters in the mask.
%
% Copyright 2014-2022 The MathWorks, Inc.



%% Model

open_system('sm_common_gear_assembly_testrig')

set_param(find_system('sm_common_gear_assembly_testrig','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_common_gear_assembly_testrig_external_mechanics_explorer_IMAGE.png>>

%% 
% <<sm_common_gear_assembly_testrig_internal_mechanics_explorer_IMAGE.png>>

%% Common Gear Assembly Subsystem
%
% <matlab:open_system('sm_common_gear_assembly_testrig');open_system('sm_common_gear_assembly_testrig/Common%20Gear%20Assembly','force'); Open Subsystem>

set_param('sm_common_gear_assembly_testrig/Common Gear Assembly','LinkStatus','none')
open_system('sm_common_gear_assembly_testrig/Common Gear Assembly','force')

%% Common Gear Assembly Constraints Subsystem
%
% The Common Gear Constraint requires that the rest of the mechanism hold
% the two frames to which it is connected in alignment.  This subsystem has
% the necessary constraints and parameterized Rigid Transform to hold the
% frames in the right position and orientation.
%
% <matlab:open_system('sm_common_gear_assembly_testrig');open_system('sm_common_gear_assembly_testrig/Common%20Gear%20Assembly/Constraints','force'); Open Subsystem>

set_param('sm_common_gear_assembly_testrig/Common Gear Assembly/Constraints','LinkStatus','none')
open_system('sm_common_gear_assembly_testrig/Common Gear Assembly/Constraints','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the speeds of the two shafts connected by the common
% gear assembly in an external configuration.
%

sm_common_gear_assembly_testrig_setgeartype(bdroot,'External')
sm_common_gear_assembly_testrig_plot1speed;

%%
%
% The plot below shows the speeds of the two shafts connected by the common
% gear assembly in an internal configuration.
%

sm_common_gear_assembly_testrig_setgeartype(bdroot,'Internal')
sim(bdroot)
sm_common_gear_assembly_testrig_plot1speed;


%%

%clear all
close all
bdclose all
