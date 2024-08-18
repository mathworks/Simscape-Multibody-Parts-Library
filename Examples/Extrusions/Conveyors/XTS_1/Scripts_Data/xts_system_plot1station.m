% Code to plot simulation results from xts_system
%% Plot Description:
%
% The plots below show the requested and current station along the track
% for each mover.
%
% Copyright 2017-2024 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_xts_system', 'var')
    sim('xts_system')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_xts_system', 'var') || ...
        ~isgraphics(h1_xts_system, 'figure')
    h1_xts_system = figure('Name', 'xts_system');
end
figure(h1_xts_system)
clf(h1_xts_system)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_xts_system.Conveyor_1.Mover_1.Mover.Vel.PS3_Sqrt_Sum.O.series.time;
simlog_m1vel = simlog_xts_system.Conveyor_1.Mover_1.Mover.Vel.PS3_Sqrt_Sum.O.series.values;
simlog_m2vel = simlog_xts_system.Conveyor_1.Mover_2.Mover.Vel.PS3_Sqrt_Sum.O.series.values;
simlog_m1Sreq = logsout_xts_system.get('Mover1_Station_Req');
simlog_m1Scur = logsout_xts_system.get('Mover1_Station_Current');
simlog_m2Sreq = logsout_xts_system.get('Mover2_Station_Req');
simlog_m2Scur = logsout_xts_system.get('Mover2_Station_Current');


% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_m1Sreq.Values.Time, simlog_m1Sreq.Values.Data,'k-.', 'LineWidth', 2)
hold on
plot(simlog_m1Scur.Values.Time, simlog_m1Scur.Values.Data, 'Color',temp_colororder(1,:),'LineWidth', 1)
hold off
grid on
title('Mover 1 Station')
ylabel('Station')
legend({'Request','Current'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_m2Sreq.Values.Time, simlog_m1Sreq.Values.Data,'k-.', 'LineWidth', 2)
hold on
plot(simlog_m2Scur.Values.Time, simlog_m1Scur.Values.Data, 'Color',temp_colororder(2,:),'LineWidth', 1)
hold off
grid on
title('Mover 2 Station')
ylabel('Station')
xlabel('Time (s)')
legend({'Request','Current'},'Location','Best');

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_R1i simlog_C1v temp_colororder

