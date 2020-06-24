%% Box Extrusion Assembly
% 
% This example shows the use of the Box Tube and Box Tube Curve blocks in
% the Simscape Multibody Parts Library.  The parts can be chained together
% to form continuous extrusions with straight and curved sections.  There
% are no joints in this model, it is simply to show how parts can be
% created.
%
% Return to <matlab:web('Multibody_Parts_Library_Overview.html'); Multibody Parts Library Overview>.
%
% Copyright 2017-2020 The MathWorks, Inc.


%% Model

open_system('sm_parts_test_tube_box')

set_param(find_system('sm_parts_test_tube_box','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_parts_test_tube_box_mechanics_explorer_IMAGE.png>>

%% Curves Subsystem
%
% This subsystem includes four curved sections, showing that the extrusion
% can curve about either axis perpendicular to the extrusion.
%
% <matlab:open_system('sm_parts_test_tube_box');open_system('sm_parts_test_tube_box/Curves','force'); Open Subsystem>

set_param('sm_parts_test_tube_box/Curves','LinkStatus','none')
open_system('sm_parts_test_tube_box/Curves','force')

%% Chain Subsystem
%
% This subsystem connects a series of straight and curved extrusions to
% form a complex shape.
%
% <matlab:open_system('sm_parts_test_tube_box');open_system('sm_parts_test_tube_box/Chain','force'); Open Subsystem>

set_param('sm_parts_test_tube_box/Chain','LinkStatus','none')
open_system('sm_parts_test_tube_box/Chain','force')

%%

%clear all
close all
bdclose all
