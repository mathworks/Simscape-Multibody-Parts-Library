% Code to plot simulation results from sm_water_powered_lift
%% Plot Description:
%
% The plot below shows the angle of the arm and the height of the lead
% screw.  A one-way clutch causes the lead screw to only advance as the
% bucket moves downward.
%
% Copyright 2017-2024 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_water_powered_lift', 'var')
    sim('sm_water_powered_lift')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_water_powered_lift', 'var') || ...
        ~isgraphics(h1_sm_water_powered_lift, 'figure')
    h1_sm_water_powered_lift = figure('Name', 'sm_water_powered_lift');
end
figure(h1_sm_water_powered_lift)
clf(h1_sm_water_powered_lift)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_water_powered_lift.Revolute_Arm.Rz.q.series.time;
simlog_qArm = simlog_sm_water_powered_lift.Revolute_Arm.Rz.q.series.values('deg');
simlog_qBucket = simlog_sm_water_powered_lift.Arm.Revolute_Bucket.Rz.q.series.values('deg');
simlog_zLead = simlog_sm_water_powered_lift.Lead_Screw.Prismatic_Joint.Pz.p.series.values('cm');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_qArm-simlog_qBucket(1), 'LineWidth', 1)
hold off
grid on
title('Arm Angle')
ylabel('Angle (deg)')

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, simlog_zLead, 'LineWidth', 1)
grid on
title('Lead Screw Height')
ylabel('Height (cm)')
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_zLead simlog_qArm simlog_qBucket

