%% Parameterized Four-Bar Linkage
% 
% This example models a four-bar linkage.  Hyperlinks in the model let you
% change the lengths of the links enables it to model a parallelogram,
% crank-rocker, or drag link linkage.
%
% Copyright 2017-2022 The MathWorks, Inc.


%% Model

open_system('sm_links_4bar')

set_param(find_system('sm_links_4bar','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Simulation Results from Simscape Logging
%%
%
% *Parallelogram Linkage*
%
% The plot below shows the mechanism parameterized to be a parallelogram
% linkage.  The moving ends of links 1 and 3 trace two circles with the
% same diameter.
%

%%
% <<sm_links_4bar_mechanics_explorer_parallelogram_IMAGE.png>>

%%
mdlwksp = get_param('sm_links_4bar','modelworkspace');
temp4barlens = mdlwksp.getVariable('parallelogram');
mdlwksp.assignin('fourbar',temp4barlens); 
sim('sm_links_4bar');
sm_links_4bar_plot1trajectory;

%%
% *Crank Rocker Linkage*
%
% The plot below shows the mechanism parameterized to be a parallelogram
% linkage.  As link 1 moves in a full circle, link 3 oscillates back and
% forth.
%

%%
% <<sm_links_4bar_mechanics_explorer_crankrocker_IMAGE.png>>

%%
mdlwksp = get_param('sm_links_4bar','modelworkspace');
temp4barlens = mdlwksp.getVariable('crankrocker');
mdlwksp.assignin('fourbar',temp4barlens); 
sim('sm_links_4bar');
sm_links_4bar_plot1trajectory;

%%
% *Drag Link Linkage*
%
% The plot below shows the mechanism parameterized to be a drag link
% linkage.  Link 1 and 3 move in full circles of different sizes.
%

%%
% <<sm_links_4bar_mechanics_explorer_draglink_IMAGE.png>>

%%
mdlwksp = get_param('sm_links_4bar','modelworkspace');
temp4barlens = mdlwksp.getVariable('draglink');
mdlwksp.assignin('fourbar',temp4barlens); 
sim('sm_links_4bar');
sm_links_4bar_plot1trajectory;

%%

%clear all
close all
bdclose all
