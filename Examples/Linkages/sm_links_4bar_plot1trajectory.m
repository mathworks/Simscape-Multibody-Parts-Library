% Code to plot simulation results from sm_links_4bar
%% Plot Description:
%
% The plot below shows the initial position of the four-bar linkage and the
% trajectories traced by the tips of links 1 and 3.
%
% Copyright 2017-2025 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_links_4bar', 'var')
    sim('sm_links_4bar')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_links_4bar', 'var') || ...
        ~isgraphics(h1_sm_links_4bar, 'figure')
    h1_sm_links_4bar = figure('Name', 'sm_links_4bar');
end
figure(h1_sm_links_4bar)
clf(h1_sm_links_4bar)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_links_4bar.Revolute_Joint_1.Rz.q.series.time;
simlog_qRz1 = simlog_sm_links_4bar.Revolute_Joint_1.Rz.q.series.values('deg');
simlog_qRz12 = simlog_sm_links_4bar.Revolute_Joint_12.Rz.q.series.values('deg');
simlog_qRz4 = simlog_sm_links_4bar.Revolute_Joint_4.Rz.q.series.values('deg');
temp_mdlwksp = get_param(bdroot,'modelworkspace');
temp_fourbarlens = temp_mdlwksp.getVariable('fourbar');
temp_len1 = temp_fourbarlens.len_1;
temp_len2 = temp_fourbarlens.len_2;
temp_len3 = temp_fourbarlens.len_3;
temp_len4 = temp_fourbarlens.len_4;

temp_j1  = [0 0];
temp_j12 = temp_len1*[cosd(simlog_qRz1(1)) sind(simlog_qRz1(1))];
temp_j23 = [temp_len4+temp_len3*cosd(simlog_qRz4(1)) temp_len3*sind(simlog_qRz4(1))];
temp_j4  = [temp_len4 0];

% Plot results
%simlog_handles(1) = subplot(2, 1, 1);
plot([temp_j1(1) temp_j12(1)], [temp_j1(2) temp_j12(2)], 'LineWidth', 6)
hold on
plot([temp_j4(1) temp_j23(1)], [temp_j4(2) temp_j23(2)], 'LineWidth', 6)
plot([temp_j12(1) temp_j23(1)], [temp_j12(2) temp_j23(2)], 'Color',temp_colororder(5,:),'LineWidth', 6)
plot(temp_len1*cosd(simlog_qRz1),temp_len1*sind(simlog_qRz1),'-','Color',temp_colororder(1,:))
plot(temp_len4+temp_len3*cosd(simlog_qRz4),temp_len3*sind(simlog_qRz4),'-','Color',temp_colororder(2,:))
hold off
grid on
title('Four-Bar Trajectory')
ylabel('Y-Position (m)')
xlabel('X-Position (m)')
axis('equal')

% Remove temporary variables
clear simlog_t simlog_handles temp_mdlwksp
clear simlog_R1i simlog_C1v temp_colororder

