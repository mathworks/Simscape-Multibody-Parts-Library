%% Circular Extrusion Assembly
% 
% This example shows the use of the Circle Tube and Circle Tube Curve
% blocks in the Simscape Multibody Parts Library.  The parts can be chained
% together to form continuous extrusions with straight and curved sections.
% There are no joints in this model, it is simply to show how parts can be
% created.
%
% Copyright 2017 The MathWorks, Inc.


%% Model

open_system('sm_parts_test_tube_circ')

set_param(find_system('sm_parts_test_tube_circ','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_parts_test_tube_circ_mechanics_explorer_IMAGE.png>>

%% Curves Subsystem
%
% This subsystem includes four curved sections, showing that the extrusion
% can curve about either axis perpendicular to the extrusion.
%
% <matlab:open_system('sm_parts_test_tube_circ');open_system('sm_parts_test_tube_circ/Curves','force'); Open Subsystem>

set_param('sm_parts_test_tube_circ/Curves','LinkStatus','none')
open_system('sm_parts_test_tube_circ/Curves','force')

%% Chain Subsystem
%
% This subsystem connects a series of straight and curved extrusions to
% form a complex shape.
%
% <matlab:open_system('sm_parts_test_tube_circ');open_system('sm_parts_test_tube_circ/Chain','force'); Open Subsystem>

set_param('sm_parts_test_tube_circ/Chain','LinkStatus','none')
open_system('sm_parts_test_tube_circ/Chain','force')

%%

clear all
close all
bdclose all
