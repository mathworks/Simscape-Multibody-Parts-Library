function [rail_spline, station_data, station_o, station_x, station_y] = xts_generate_track(track_seq)
% Copyright 2017-2018 The MathWorks, Inc.

% Generate spline for Point on Curve Constraint
[rail_spline, station_data] = xts_generate_spline(track_seq);


%% Create data for lookup table
% Create grid of unique x and y breakpoints
station_x = unique(station_data(:,2));
station_y = unique(station_data(:,3));

% Loop through table to assign station numbers to correct locations
% Unassigned indices in table receive a 0
station_o = zeros(length(station_y),length(station_x));
for sty_i = 1:length(station_y)
    for stx_i = 1:length(station_x)
        for stl_i = 1:size(station_data,1)
            if (station_data(stl_i,2)==station_x(stx_i) &&...
                    station_data(stl_i,3)==station_y(sty_i))
                station_o(sty_i,stx_i) = station_data(stl_i,1);
            end
        end
    end
end
