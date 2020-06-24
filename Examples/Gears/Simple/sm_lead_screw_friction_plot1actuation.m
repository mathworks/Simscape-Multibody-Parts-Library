% Code to plot simulation results from sm_lead_screw_friction
%% Plot Description:
%
% The plot below shows the actuation torque of the lead screw.
%
% Copyright 2017-2020 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_lead_screw_friction', 'var')
    sim('sm_lead_screw_friction')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_lead_screw_friction', 'var') || ...
        ~isgraphics(h1_sm_lead_screw_friction, 'figure')
    h1_sm_lead_screw_friction = figure('Name', 'sm_lead_screw_friction');
end
figure(h1_sm_lead_screw_friction)
clf(h1_sm_lead_screw_friction)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_lead_screw_friction.Revolute_Screw.Rz.q.series.time;
simlog_qScrew = simlog_sm_lead_screw_friction.Revolute_Screw.Rz.q.series.values('rev');
simlog_zSlider = simlog_sm_lead_screw_friction.Prismatic_Slider.Pz.p.series.values('m');
simlog_trqAct = logsout_sm_lead_screw_friction.get('actuation_torque');
simlog_fLoad = logsout_sm_lead_screw_friction.get('load_force');

temp_direction = get_param([bdroot '/Lead Screw Joint'],'Direction');
temp_mus = get_param([bdroot '/Lead Screw Friction'],'mu_static');
temp_muk = get_param([bdroot '/Lead Screw Friction'],'mu_kinetic');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
yyaxis left
plot(simlog_t, simlog_qScrew, 'LineWidth', 1)
ylabel('Revolutions');
temp_ylim = get(gca,'YLim');
temp_maxyrange = max(abs(simlog_qScrew(1)-temp_ylim));
set(gca,'YLim',...
    [simlog_qScrew(1)-temp_maxyrange ...
    simlog_qScrew(1)+temp_maxyrange]);
text(0.01,0.075,...
    ['Direction: ' temp_direction '; \mu Static: ' temp_mus '; \mu Kinetic: ' temp_muk],...
    'Units','normalized');
yyaxis right
plot(simlog_t, simlog_zSlider, 'LineWidth', 1)
ylabel('Position (m)')
temp_ylim = get(gca,'YLim');
temp_maxyrange = max(abs(simlog_zSlider(1)-temp_ylim));
set(gca,'YLim',...
    [simlog_zSlider(1)-temp_maxyrange ...
    simlog_zSlider(1)+temp_maxyrange]);

grid on
title('Lead Screw Motion')
legend({'Screw','Slider'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
yyaxis left
stairs(simlog_trqAct.Values.Time,simlog_trqAct.Values.Data , 'LineWidth', 2)
temp_ylim = get(gca,'YLim');
set(gca,'YLim',...
    [temp_ylim(1)-0.05*(temp_ylim(2)-temp_ylim(1)) ...
    temp_ylim(2)+0.05*(temp_ylim(2)-temp_ylim(1))]);
grid on
ylabel('Torque (Nm)')
yyaxis right
stairs(simlog_fLoad.Values.Time,simlog_fLoad.Values.Data , 'LineWidth', 2)
temp_ylim = get(gca,'YLim');
set(gca,'YLim',...
    [temp_ylim(1)-0.05*(temp_ylim(2)-temp_ylim(1)) ...
    temp_ylim(2)+0.05*(temp_ylim(2)-temp_ylim(1))]);
ylabel('Force (N)')
title('Actuation and Load')
legend({'Actuation Torque','Load Force'},'Location','Best');
xlabel('Time (s)')

set_param([bdroot '/Lead Screw Joint'],'Direction','RightHand');

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_qNut simlog_fLoad
clear simlog_trqAct simlog_zScrew temp_ylim

