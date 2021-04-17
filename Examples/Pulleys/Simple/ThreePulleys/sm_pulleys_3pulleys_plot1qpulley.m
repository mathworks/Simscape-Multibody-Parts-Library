% Code to plot simulation results from sm_pulleys_3pulleys
%% Plot Description:
%
% The plots below show the angle of each pulley and the torqure required to
% produce this motion
%
% Copyright 2018-2021 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_pulleys_3pulleys', 'var')
    sim('sm_pulleys_3pulleys')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_pulleys_3pulleys', 'var') || ...
        ~isgraphics(h1_sm_pulleys_3pulleys, 'figure')
    h1_sm_pulleys_3pulleys = figure('Name', 'sm_pulleys_3pulleys');
end
figure(h1_sm_pulleys_3pulleys)
clf(h1_sm_pulleys_3pulleys)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_pulleys_3pulleys.Pulleys.Revolute_B.Rz.q.series.time;
simlog_qB = simlog_sm_pulleys_3pulleys.Pulleys.Revolute_B.Rz.q.series.values('deg');
simlog_qC = simlog_sm_pulleys_3pulleys.Pulleys.Revolute_C.Rz.q.series.values('deg');
simlog_qA = simlog_sm_pulleys_3pulleys.Revolute_A.Rz.q.series.values('deg');

simlog_trqA = logsout_sm_pulleys_3pulleys.get('trqA');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_qA, simlog_t, simlog_qB, ...
    simlog_t, simlog_qC, 'LineWidth', 1)
hold off
grid on
title('Pulley Angle')
ylabel('Angle (deg)')
legend({'Pulley A','Pulley B','Pulley C'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_trqA.Values.Time, simlog_trqA.Values.Data, 'LineWidth', 1)
grid on
title('Drive Torque')
ylabel('Torque (Nm)')
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_qA simlog_qB simlog_qC 

