% Code to plot simulation results from sm_planetary_gear_testrig
%% Plot Description:
%
% The plot below shows the speeds of the three shafts attached to the
% planetary gear as different pairs of shafts are driven and locked.
%
% Copyright 2017-2023 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_planetary_gear_testrig', 'var')
    sim('sm_planetary_gear_testrig')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_planetary_gear_testrig', 'var') || ...
        ~isgraphics(h1_sm_planetary_gear_testrig, 'figure')
    h1_sm_planetary_gear_testrig = figure('Name', 'sm_planetary_gear_testrig');
end
figure(h1_sm_planetary_gear_testrig)
clf(h1_sm_planetary_gear_testrig)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_planetary_gear_testrig.Sun_Shaft_Input.Revolute_Brake.Rz.w.series.time;
simlog_wSun = simlog_sm_planetary_gear_testrig.Sun_Shaft_Input.Revolute_Brake.Rz.w.series.values('rpm');
simlog_wRing = simlog_sm_planetary_gear_testrig.Ring_Shaft_Input.Revolute_Brake.Rz.w.series.values('rpm');
simlog_wCarr = simlog_sm_planetary_gear_testrig.Carrier_Shaft_Input.Revolute_Brake.Rz.w.series.values('rpm');

% Plot results
plot(simlog_t, simlog_wRing, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_wCarr, 'LineWidth', 1)
plot(simlog_t, simlog_wSun, 'LineWidth', 1)
hold off
grid on
title('Planetary Gear Shaft Speeds')
ylabel('Speed (RPM)')
legend({'Ring','Carrier','Sun'},'Location','Best');
xlabel('Time (s)')

% Remove temporary variables
clear simlog_t temp_colororder
clear simlog_wCarr simlog_wSun simlog_wRing 
