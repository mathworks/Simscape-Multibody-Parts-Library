%% Five-Bar Linkage Stamping Mechanism
% 
% This example models a stamping mechanism using the Simscape Multibody
% Parts Library.  It is a five-bar linkage with a single degree of freedom.
% Assembling basic, parameterized parts enables quick modeling of a
% mechanism with a complex movement.  Varying the parameter values enables
% exploration of the motion this mechanism can achieve.
%
% Copyright 2017-2024 The MathWorks, Inc.



%% Model

open_system('sm_links_5bar_stamp')

set_param(find_system('sm_links_5bar_stamp','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% <<sm_links_5bar_stamp_mechanics_explorer_IMAGE.png>>
%% Link 3 Subsystem
%
% This subsystem models a linkage with a bend and three attachment points.
% Straight and curved parts are combined to create the linkage.  Block
% Transform Center Pin adds a frame at the correct location for the pin.
%
% <matlab:open_system('sm_links_5bar_stamp');open_system('sm_links_5bar_stamp/Link%203','force'); Open Subsystem>

set_param('sm_links_5bar_stamp/Link 3','LinkStatus','none')
open_system('sm_links_5bar_stamp/Link 3','force')

%% Link 4 Subsystem
%
% This subsystem models another curved linkage with three attachment
% points.  The stamping pad is attached to the end of the link.
%
% <matlab:open_system('sm_links_5bar_stamp');open_system('sm_links_5bar_stamp/Link%204','force'); Open Subsystem>

set_param('sm_links_5bar_stamp/Link 4','LinkStatus','none')
open_system('sm_links_5bar_stamp/Link 4','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the height of the stamping pad as Link 1 rotates.
%


sm_links_5bar_stamp_plot1height;

%%

%clear all
close all
bdclose all
