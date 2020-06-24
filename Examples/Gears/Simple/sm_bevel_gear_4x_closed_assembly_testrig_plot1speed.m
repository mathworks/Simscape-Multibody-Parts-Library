% Code to plot simulation results from sm_bevel_gear_4x_closed_assembly_testrig
%% Plot Description:
%
% The plot below shows the speeds of the four gears connected by the
% bevel gear assembly.
%
% Copyright 2017-2020 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_bevel_gear_4x_closed_assembly_testrig', 'var')
    sim('sm_bevel_gear_4x_closed_assembly_testrig')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_bevel_gear_4x_closed_assembly_testrig', 'var') || ...
        ~isgraphics(h1_sm_bevel_gear_4x_closed_assembly_testrig, 'figure')
    h1_sm_bevel_gear_4x_closed_assembly_testrig = figure('Name', 'sm_bevel_gear_4x_closed_assembly_testrig');
end
figure(h1_sm_bevel_gear_4x_closed_assembly_testrig)
clf(h1_sm_bevel_gear_4x_closed_assembly_testrig)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_bevel_gear_4x_closed_assembly_testrig.Bevel_Gear_4x_Closed_Assembly.Constraints.Revolute_Gear_B1.Rz.w.series.time;
simlog_wB1 = simlog_sm_bevel_gear_4x_closed_assembly_testrig.Bevel_Gear_4x_Closed_Assembly.Constraints.Revolute_Gear_B1.Rz.w.series.values('rpm');
simlog_wB2 = simlog_sm_bevel_gear_4x_closed_assembly_testrig.Bevel_Gear_4x_Closed_Assembly.Constraints.Revolute_Gear_B2.Rz.w.series.values('rpm');
simlog_wF1 = simlog_sm_bevel_gear_4x_closed_assembly_testrig.Bevel_Gear_4x_Closed_Assembly.Constraints.Revolute_Gear_F1.Rz.w.series.values('rpm');
simlog_wF2 = simlog_sm_bevel_gear_4x_closed_assembly_testrig.Bevel_Gear_4x_Closed_Assembly.Constraints.Revolute_Gear_F2.Rz.w.series.values('rpm');

% Plot results
plot(simlog_t, simlog_wB1, simlog_t, simlog_wF1, 'LineWidth', 3)
hold on
plot(simlog_t, simlog_wB2, simlog_t, simlog_wF2, 'LineWidth', 2,'LineStyle','--')
hold off
grid on
title('Shaft Speeds')
ylabel('Speed (rpm)')
legend({'Shaft B1','Shaft F1','Shaft B2','Shaft F2'},'Location','Best');
xlabel('Time (s)')


% Remove temporary variables
clear simlog_t temp_colororder
clear simlog_wB1 simlog_wB2 simlog_wF1 simlog_wF2
