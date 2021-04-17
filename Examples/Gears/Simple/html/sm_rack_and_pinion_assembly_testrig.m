%% Rack and Pinion Assembly Testrig
% 
% This example models a gear and a toothed bar (rack).  The necessary
% blocks for the rack and pinion assembly are contained in a masked
% subsystem with the key parameters exposed in a dialog box.
%
% Copyright 2014-2021 The MathWorks, Inc.


%% Model

open_system('sm_rack_and_pinion_assembly_testrig')

set_param(find_system('sm_rack_and_pinion_assembly_testrig','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Rack and Pinion Assembly Subsystem
%
% <matlab:open_system('sm_rack_and_pinion_assembly_testrig');open_system('sm_rack_and_pinion_assembly_testrig/Rack%20and%20Pinion%20Assembly','force'); Open Subsystem>

set_param('sm_rack_and_pinion_assembly_testrig/Rack and Pinion Assembly','LinkStatus','none')
open_system('sm_rack_and_pinion_assembly_testrig/Rack and Pinion Assembly','force')

%% Rack and Pinion Assembly Constraints Subsystem
%
% The Rack and Pinion Constraint requires that the rest of the mechanism hold
% the two frames to which it is connected in alignment.  This subsystem has
% the necessary constraints and parameterized Rigid Transform to hold the
% frames in the right position and orientation.
%
% <matlab:open_system('sm_rack_and_pinion_assembly_testrig');open_system('sm_rack_and_pinion_assembly_testrig/Rack%20and%20Pinion%20Assembly/Constraints','force'); Open Subsystem>

set_param('sm_rack_and_pinion_assembly_testrig/Rack and Pinion Assembly/Constraints','LinkStatus','none')
open_system('sm_rack_and_pinion_assembly_testrig/Rack and Pinion Assembly/Constraints','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the speeds of the rack and pinion.
%

sm_rack_and_pinion_assembly_testrig_plot1speed;

%%

%clear all
close all
bdclose all
