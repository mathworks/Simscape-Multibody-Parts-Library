% Code to plot simulation results from sm_links_slider_crank
%% Plot Description:
%
% This plot shows the position of the slider in the slider-crank mechanism.
%
% Copyright 2017-2020 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_links_slider_crank', 'var')
    sim('sm_links_slider_crank')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_links_slider_crank', 'var') || ...
        ~isgraphics(h1_sm_links_slider_crank, 'figure')
    h1_sm_links_slider_crank = figure('Name', 'sm_links_slider_crank');
end
figure(h1_sm_links_slider_crank)
clf(h1_sm_links_slider_crank)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_links_slider_crank.Prismatic_Joint.Pz.p.series.time;
simlog_zSlider = simlog_sm_links_slider_crank.Prismatic_Joint.Pz.p.series.values('m');

% Plot results
plot(simlog_t, simlog_zSlider, 'LineWidth', 1)
grid on
title('Slider Position')
ylabel('Position (m)')
xlabel('Time (s)')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_zSlider temp_colororder

