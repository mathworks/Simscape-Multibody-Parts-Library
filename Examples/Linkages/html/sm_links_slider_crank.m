%% Slider Crank Linkage
% 
% This example models a slider-crank mechanism using parts from the
% Simscape Multibody Parts Library.
%
% Copyright 2017-2022 The MathWorks, Inc.


%% Model

open_system('sm_links_slider_crank')

set_param(find_system('sm_links_slider_crank','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%%
% <<sm_links_slider_crank_mechanics_explorer_IMAGE.png>>

%% Slider Subsystem
%
% This subsystem combines a few parts to model the slider.  Block Transform
% F creates the interface frame that is properly oriented for the
% translational degree of freedom.
%
% <matlab:open_system('sm_links_slider_crank');open_system('sm_links_slider_crank/Slider','force'); Open Subsystem>

set_param('sm_links_slider_crank/Slider','LinkStatus','none')
open_system('sm_links_slider_crank/Slider','force')

%% Simulation Results from Simscape Logging
%%
%
% This plot shows the position of the slider in the slider-crank mechanism.
%


sm_links_slider_crank_plot1position;

%%

%clear all
close all
bdclose all
