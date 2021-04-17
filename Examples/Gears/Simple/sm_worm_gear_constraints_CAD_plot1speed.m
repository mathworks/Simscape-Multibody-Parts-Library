% Code to plot simulation results from sm_worm_gear_constraints_CAD
%% Plot Description:
%
% The plot below shows the speeds of the two shafts connected by the worm
% gear assembly.
%
% Copyright 2017-2021 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_worm_gear_constraints_CAD', 'var')
    sim('sm_worm_gear_constraints_CAD')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_worm_gear_constraints_CAD', 'var') || ...
        ~isgraphics(h1_sm_worm_gear_constraints_CAD, 'figure')
    h1_sm_worm_gear_constraints_CAD = figure('Name', 'sm_worm_gear_constraints_CAD');
end
figure(h1_sm_worm_gear_constraints_CAD)
clf(h1_sm_worm_gear_constraints_CAD)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_worm_gear_constraints_CAD.Worm_Gear_Constraints.Revolute_Worm.Rz.w.series.time;
simlog_wB = simlog_sm_worm_gear_constraints_CAD.Worm_Gear_Constraints.Revolute_Worm.Rz.w.series.values('rpm');
simlog_wF = simlog_sm_worm_gear_constraints_CAD.Worm_Gear_Constraints.Revolute_Gear.Rz.w.series.values('rpm');

% Plot results
yyaxis left
plot(simlog_t, simlog_wB, 'LineWidth', 1)
grid on
ylabel('Worm Speed (rpm)')
yyaxis right
plot(simlog_t, simlog_wF, 'LineWidth', 1)
ylabel('Gear Speed (rpm)')
title('Shaft Speeds')
xlabel('Time (s)')


% Remove temporary variables
clear simlog_t temp_colororder
clear simlog_wB simlog_wF