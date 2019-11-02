% Code to plot simulation results from xts_system
%% Plot Description:
%
% The plots below show speed and position along the global x-axis for
% each mover.
%
% Copyright 2017-2018 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_xts_system', 'var')
    sim('xts_system')
end

% Reuse figure if it exists, else create new figure
if ~exist('h2_xts_system', 'var') || ...
        ~isgraphics(h2_xts_system, 'figure')
    h2_xts_system = figure('Name', 'xts_system');
end
figure(h2_xts_system)
clf(h2_xts_system)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_xts_system.Conveyor_1.Mover_1.Mover.Vel.PS3_Sqrt_Sum.O.series.time;
simlog_m1vel = simlog_xts_system.Conveyor_1.Mover_1.Mover.Vel.PS3_Sqrt_Sum.O.series.values;
simlog_m2vel = simlog_xts_system.Conveyor_1.Mover_2.Mover.Vel.PS3_Sqrt_Sum.O.series.values;
simlog_m1px = simlog_xts_system.Conveyor_1.Mover_1.Mover.Planar_Joint.Px.p.series.values('m');
simlog_m2px = simlog_xts_system.Conveyor_1.Mover_2.Mover.Planar_Joint.Px.p.series.values('m');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_m1vel,'LineWidth', 1)
hold on
plot(simlog_t, simlog_m2vel,'LineWidth', 1)
hold off
grid on
title('Mover Speed')
ylabel('Speed (m/s)')
legend({'Mover 1','Mover 2'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, simlog_m1px,'LineWidth', 1)
hold on
plot(simlog_t, simlog_m2px,'LineWidth', 1)
hold off
grid on
title('Mover X-Position')
ylabel('Position (m)')
xlabel('Time (s)')
legend({'Mover 1','Mover 2'},'Location','Best');

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_R1i simlog_C1v temp_colororder

