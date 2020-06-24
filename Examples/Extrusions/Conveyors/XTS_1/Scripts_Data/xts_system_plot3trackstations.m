% Code to plot simulation results from xts_system
%% Plot Description:
%
% The plot shows the track of the transport system and the stations along the track.
%
% Copyright 2017-2020 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_xts_system', 'var')
    sim('xts_system')
end

% Reuse figure if it exists, else create new figure
if ~exist('h3_xts_system', 'var') || ...
        ~isgraphics(h3_xts_system, 'figure')
    h3_xts_system = figure('Name', 'xts_system');
end
figure(h3_xts_system)
clf(h3_xts_system)

if (~exist('rail_spline'))
    [rail_spline, station_data] = xts_generate_spline(track_seq);
end

% Plot results
plot(rail_spline(:,1),rail_spline(:,2),'-x');axis equal
hold on
for temp_sti=1:length(station_data)
    text(station_data(temp_sti,2),station_data(temp_sti,3),num2str(station_data(temp_sti,1)),...
        'FontWeight','bold',...
    'HorizontalAlignment','center');
end
hold off
xlabel('Y-Position (m)')
xlabel('X-Position (m)')
title('Stations on Track')

legend({'Spline Points'},'Location','Best');

% Remove temporary variables
clear simlog_t simlog_handles
clear temp_sti

