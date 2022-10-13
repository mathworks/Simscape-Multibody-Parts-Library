%% Lead Screw with Friction
% 
% This example models a lead screw with friction. The constraint force in
% the lead screw is measured and used to calculate the friction torque
% within the lead screw. A continuous stick-slip friction model is used to
% determine the coefficient of friction based on the relative rotational
% speed of the two parts connected by the lead screw.
%
% Copyright 2014-2022 The MathWorks, Inc.



%% Model

open_system('sm_lead_screw_friction')

set_param(find_system('sm_lead_screw_friction','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')
%% 
% <<sm_lead_screw_friction_mechanics_explorer_IMAGE.png>>

%% Lead Screw Friction Subsystem
%
% This subsystem calculates and applies the friction torque to the two
% parts connected by the lead screw joint. The following free-body diagram
% shows the relevant parameters and forces acting on the system.
%
% <<sm_lead_screw_friction_force_diagram.png>>
%
% The friction equation is:
% 
% $Torque_{friction} = F_{load} \cdot r_{screw} \cdot \mu$ 
%
% If $\mu > tan(\lambda)$, the lead screw is non-backdriveable.  Applying
% an axial load force will not be sufficient to permit the lead screw to
% move.
%
% <matlab:open_system('sm_lead_screw_friction');open_system('sm_lead_screw_friction/Lead%20Screw%20Friction','force'); Open Subsystem>

set_param('sm_lead_screw_friction/Lead Screw Friction','LinkStatus','none')
open_system('sm_lead_screw_friction/Lead Screw Friction','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the actuation torque of the lead screw.  In this
% test, the coefficient of friction is low enough that the load force can
% backdrive the lead screw.
%

set_param([bdroot '/Lead Screw Joint'],'Direction','RightHand');
set_param([bdroot '/Lead Screw Friction'],'mu_kinetic','0.195');
set_param([bdroot '/Lead Screw Friction'],'mu_static','0.195');
sm_lead_screw_friction_plot1actuation;

%%
%
% The Lead Screw Joint can be configured such that positive rotation leads to
% positive translation.
%

clf
set_param([bdroot '/Lead Screw Joint'],'Direction','LeftHand');
sim(bdroot)
sm_lead_screw_friction_plot1actuation;

%%
%
% Increasing the coefficient of friction higher than the tangent of the
% lead angle will make the lead screw non-backdriveable.  Applying an axial
% load force will not be sufficient for the screw to move.
%

clf
set_param([bdroot '/Lead Screw Joint'],'Direction','LeftHand');
set_param([bdroot '/Lead Screw Friction'],'mu_kinetic','0.205');
set_param([bdroot '/Lead Screw Friction'],'mu_static','0.205');
sim(bdroot)
sm_lead_screw_friction_plot1actuation;

%%

%clear all
close all
bdclose all
