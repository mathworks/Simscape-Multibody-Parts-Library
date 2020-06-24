% Code to plot simulation results from sm_pulleys_xytable_cross
%% Plot Description:
%
% This plot shows the XY position of the table
%
% Copyright 2018-2020 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_sm_pulleys_xytable_cross', 'var')
    sim('sm_pulleys_xytable_cross')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sm_pulleys_xytable_cross', 'var') || ...
        ~isgraphics(h1_sm_pulleys_xytable_cross, 'figure')
    h1_sm_pulleys_xytable_cross = figure('Name', 'sm_pulleys_xytable_cross');
end
figure(h1_sm_pulleys_xytable_cross)
clf(h1_sm_pulleys_xytable_cross)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_sm_pulleys_xytable_cross.Platform.Prismatic_Slider.Pz.p.series.time;
simlog_Tpx = simlog_sm_pulleys_xytable_cross.Platform.Prismatic_Slider.Pz.p.series.values('m');
simlog_Tpy = simlog_sm_pulleys_xytable_cross.Platform.Prismatic_Table.Pz.p.series.values('m');

% Get values
mdlWks = get_param('sm_pulleys_xytable_cross','ModelWorkspace');
temp_t_pos_w   = mdlWks.getVariable('t_pos_w');
temp_p_gd      = mdlWks.getVariable('p_gd');
temp_t_base_l  = mdlWks.getVariable('t_base_l');
temp_t_p_hr    = mdlWks.getVariable('p_hr');
temp_rad_drive = mdlWks.getVariable('rad_drive');

temp_XData = [-1 1]*(temp_t_base_l/2-temp_t_p_hr*2+temp_rad_drive+temp_p_gd);
temp_YData = [-temp_t_pos_w/2 temp_t_pos_w/2+temp_p_gd];

% Plot results
temp_img = imread('sm_pulleys_xytable_cross_topView_IMAGE.png');
image('CData',flipud(temp_img),'XData',temp_XData,'YData',temp_YData);
hold on
plot(simlog_Tpx, simlog_Tpy, 'r', 'LineWidth', 2)
hold off
box on
title('Table Position')
xlabel('X Position (m)')
ylabel('Y Position (m)')
axis('equal')

% Remove temporary variables
clear simlog_Tpx simlog_Tpy temp_colororder
clear temp_img
