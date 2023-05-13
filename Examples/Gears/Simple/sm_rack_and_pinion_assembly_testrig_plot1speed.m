% Code to plot simulation results from sm_rack_and_pinion_assembly_testrig
%% Plot Description:
%
% The plot below shows the speeds of the rack and pinion.
%
% Copyright 2017-2023 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_rack_and_pinion_assembly_testrig', 'var')
    sim('sm_rack_and_pinion_assembly_testrig')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_rack_and_pinion_assembly_testrig', 'var') || ...
        ~isgraphics(h1_sm_rack_and_pinion_assembly_testrig, 'figure')
    h1_sm_rack_and_pinion_assembly_testrig = figure('Name', 'sm_rack_and_pinion_assembly_testrig');
end
figure(h1_sm_rack_and_pinion_assembly_testrig)
clf(h1_sm_rack_and_pinion_assembly_testrig)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_rack_and_pinion_assembly_testrig.Rack_and_Pinion_Assembly.Constraints.Revolute_Pinion.Rz.w.series.time;
simlog_wP = simlog_sm_rack_and_pinion_assembly_testrig.Rack_and_Pinion_Assembly.Constraints.Revolute_Pinion.Rz.w.series.values('rpm');
simlog_vR = simlog_sm_rack_and_pinion_assembly_testrig.Rack_and_Pinion_Assembly.Constraints.Prismatic_Rack.Pz.v.series.values('m/s');

% Plot results
yyaxis left
plot(simlog_t, simlog_wP, 'LineWidth', 1)
ylabel('Pinion Speed (RPM)')
yyaxis right
plot(simlog_t, simlog_vR, 'LineWidth', 1)
ylabel('Rack Speed (m/s)')
grid on
title('Rack and Pinion Speeds')
xlabel('Time (s');

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_wP simlog_vR 

