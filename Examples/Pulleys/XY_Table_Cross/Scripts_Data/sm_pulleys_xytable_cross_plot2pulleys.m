% Code to plot simulation results from sm_pulleys_xytable_cross
%% Plot Description:
%
% This plot shows the XY position of the table
%
% Copyright 2018-2021 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_pulleys_xytable_cross', 'var')
    sim('sm_pulleys_xytable_cross')
end

% Reuse figure if it exists, else create new figure
if ~exist('h2_sm_pulleys_xytable_cross', 'var') || ...
        ~isgraphics(h2_sm_pulleys_xytable_cross, 'figure')
    h2_sm_pulleys_xytable_cross = figure('Name', 'sm_pulleys_xytable_cross');
end
figure(h2_sm_pulleys_xytable_cross)
clf(h2_sm_pulleys_xytable_cross)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_pulleys_xytable_cross.Platform.Prismatic_Slider.Pz.p.series.time;
if (simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P6.hasChild('Actuate'))
    simlog_q2 = simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P2.Actuate.Revolute_P2.Rz.q.series.values('deg');
    simlog_q6 = simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P6.Actuate.Revolute_P6.Rz.q.series.values('deg');
else
    simlog_q2 = simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P2.Measure.Revolute_P2.Rz.q.series.values('deg');
    simlog_q6 = simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P6.Measure.Revolute_P6.Rz.q.series.values('deg');
end    

simlog_trqP2 = logsout_sm_pulleys_xytable_cross.get('trqP2');
simlog_trqP6 = logsout_sm_pulleys_xytable_cross.get('trqP6');


% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_q2, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_q6, 'LineWidth', 1)
hold off
grid on
title('Driven Pulley Angles')
ylabel('Angle (deg)')
legend({'P2','P6'},'Location','Best')

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_trqP2.Values.Time, simlog_trqP2.Values.Data, 'LineWidth', 1)
hold on
plot(simlog_trqP6.Values.Time, simlog_trqP6.Values.Data, 'LineWidth', 1)
hold off
grid on
title('Required Torque')
ylabel('Torque (Nm)')
xlabel('Time (s)');


% Remove temporary variables
clear simlog_t temp_colororder simlog_handles
clear simlog_q2 simlog_q6 simlog_trqP2 simlog_trqP6


