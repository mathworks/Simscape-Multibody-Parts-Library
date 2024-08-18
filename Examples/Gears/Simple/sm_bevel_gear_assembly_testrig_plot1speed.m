% Code to plot simulation results from sm_bevel_gear_assembly_testrig
%% Plot Description:
%
% The plot below shows the speeds of the two shafts connected by the bevel
% gear assembly.
%
% Copyright 2017-2024 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_bevel_gear_assembly_testrig', 'var')
    sim('sm_bevel_gear_assembly_testrig')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_bevel_gear_assembly_testrig', 'var') || ...
        ~isgraphics(h1_sm_bevel_gear_assembly_testrig, 'figure')
    h1_sm_bevel_gear_assembly_testrig = figure('Name', 'sm_bevel_gear_assembly_testrig');
end
figure(h1_sm_bevel_gear_assembly_testrig)
clf(h1_sm_bevel_gear_assembly_testrig)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_bevel_gear_assembly_testrig.Bevel_Gear_Assembly.Constraints.Revolute_Gear_B.Rz.w.series.time;
simlog_wB = simlog_sm_bevel_gear_assembly_testrig.Bevel_Gear_Assembly.Constraints.Revolute_Gear_B.Rz.w.series.values('rpm');
simlog_wF = simlog_sm_bevel_gear_assembly_testrig.Bevel_Gear_Assembly.Constraints.Revolute_Gear_F.Rz.w.series.values('rpm');

% Plot results
plot(simlog_t, simlog_wB, simlog_t, simlog_wF, 'LineWidth', 1)
grid on
title('Shaft Speeds')
ylabel('Speed (rpm)')
legend({'Shaft B','Shaft F'},'Location','Best');
xlabel('Time (s)')


% Remove temporary variables
clear simlog_t temp_colororder
clear simlog_wB simlog_wF


