% Parameters for XTS conveyor system
% Copyright 2017-2025 The MathWorks, Inc.

% Actuation and control
xts_ctrl_dead_zone = 0.005; %m
xts_ctrl_max_force = 50; %m
xts_ctrl_on_off_gain = 1000; %m
xts_rail_visc_frict = 50;

% Define rail profile and track
xts_rail_extr_data

% Define mover extrusion datas
xts_mover_extr_data

% Track parameters
track_curve_radius = 0.165;
track_straight_len = 0.550;

%% Track segments - each row is a segment
% length/radius, angle
xts_track_seg_oval = [
    track_straight_len   0
    track_curve_radius   180
    track_straight_len   0
    track_curve_radius   180];

xts_track_seg_square = [
    track_straight_len     0
    track_curve_radius   90
    track_straight_len     0
    track_curve_radius   90
    track_straight_len     0
    track_curve_radius   90
    track_straight_len     0
    track_curve_radius   90
    ];

xts_track_seg = xts_track_seg_oval;
[rail_spline, station_data, station_o, station_x, station_y] = xts_generate_track(xts_track_seg);

