% Code to plot simulation results from sm_links_5bar_stamp
%% Plot Description:
%
% The plot below shows the height of the stamping pad as Link 1 rotates.
%
% Copyright 2017-2018 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_links_5bar_stamp', 'var')
    sim('sm_links_5bar_stamp')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_links_5bar_stamp', 'var') || ...
        ~isgraphics(h1_sm_links_5bar_stamp, 'figure')
    h1_sm_links_5bar_stamp = figure('Name', 'sm_links_5bar_stamp');
end
figure(h1_sm_links_5bar_stamp)
clf(h1_sm_links_5bar_stamp)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_yStamp = logsout_sm_links_5bar_stamp.get('stamp_height');

% Plot results
plot(simlog_yStamp.Values.Time, simlog_yStamp.Values.Data, 'LineWidth', 1)
grid on
title('Stamp Height')
ylabel('Height (m)')
xlabel('Time (s)')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_yStamp temp_colororder

