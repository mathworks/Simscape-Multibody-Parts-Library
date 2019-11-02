% Code to plot simulation results from sm_lead_screw_actuation_torque
%% Plot Description:
%
% The plot below shows the actuation torque of the lead screw.
%
% Copyright 2017 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_lead_screw_actuation_torque', 'var')
    sim('sm_lead_screw_actuation_torque')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_lead_screw_actuation_torque', 'var') || ...
        ~isgraphics(h1_sm_lead_screw_actuation_torque, 'figure')
    h1_sm_lead_screw_actuation_torque = figure('Name', 'sm_lead_screw_actuation_torque');
end
figure(h1_sm_lead_screw_actuation_torque)
clf(h1_sm_lead_screw_actuation_torque)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_lead_screw_actuation_torque.Revolute_Nut.Rz.q.series.time;
simlog_qNut = simlog_sm_lead_screw_actuation_torque.Revolute_Nut.Rz.q.series.values('rev');
simlog_zScrew = simlog_sm_lead_screw_actuation_torque.Prismatic_Screw.Pz.p.series.values('m');
simlog_trqAct = logsout_sm_lead_screw_actuation_torque.get('actuation_torque');
simlog_fLoad = logsout_sm_lead_screw_actuation_torque.get('load_force');


% Plot results
simlog_handles(1) = subplot(2, 1, 1);
yyaxis left
plot(simlog_t, simlog_qNut, 'LineWidth', 1)
ylabel('Revolutions')
yyaxis right
plot(simlog_t, simlog_zScrew, 'LineWidth', 1)
ylabel('Position (m)')
grid on
title('Lead Screw Motion')
legend({'Nut','Screw'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
yyaxis left
plot(simlog_trqAct.Values.Time,simlog_trqAct.Values.Data , 'LineWidth', 1)
grid on
ylabel('Torque (Nm)')
yyaxis right
plot(simlog_fLoad.Values.Time,simlog_fLoad.Values.Data , 'LineWidth', 1)

temp_ylim = get(gca,'YLim');
set(gca,'YLim',...
    [temp_ylim(1)-0.05*(temp_ylim(2)-temp_ylim(1)) ...
     temp_ylim(2)+0.05*(temp_ylim(2)-temp_ylim(1))]);
    

ylabel('Force (N)')
title('Actuation Torque')
legend({'Actuation Torque','Load Force'},'Location','Best');
xlabel('Time (s)')

set_param([bdroot '/Lead Screw Joint'],'Direction','RightHand');

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_qNut simlog_fLoad
clear simlog_trqAct simlog_zScrew temp_ylim

