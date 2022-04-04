function [rail_spline, station_data] = xts_generate_spline(track_seg)
% Copyright 2017-2022 The MathWorks, Inc.

% Number of stations per segment type (straight, curved)
numStStraight = 2;
numStCurve = 4;

% Calculate track length
track_len = 0;
for seg_i=1:size(track_seg,1)
    if (track_seg(seg_i,2) == 0)
        track_len = track_len+track_seg(seg_i,1);
    else
        track_len = track_len+track_seg(seg_i,1)*track_seg(seg_i,2)*pi/180;
    end
end

% Initialize variables
xy_data = [0 0];
current_angle = 0;
current_end = [0 0];
station_data = [1 0 0]; % Station number, x, y

% Loop over segments to create spline and station data
for seg_i=1:size(track_seg,1)
    num_stations = size(station_data,1);
    
    % If straight segment, append spline points and station data
    if (track_seg(seg_i,2) == 0)
        
        % Append spline points
        xy_data = [xy_data; current_end(1)+track_seg(seg_i,1)*cosd(track_seg(seg_i,2)+current_angle) current_end(2)-track_seg(seg_i,1)*sind(track_seg(seg_i,2)+current_angle)];
        
        % Add numStStraight station data points
        for st_i = 1:numStStraight
            station_data(num_stations+st_i,1) = num_stations+st_i;
            station_data(num_stations+st_i,2) = station_data(num_stations,2) + ...
                track_seg(seg_i,1)*st_i/numStStraight*cosd(track_seg(seg_i,2)+current_angle);
            station_data(num_stations+st_i,3) = station_data(num_stations,3) - ...
                track_seg(seg_i,1)*st_i/numStStraight*sind(track_seg(seg_i,2)+current_angle);
        end
        
    else
        % Else curved segment, append spline points and station data
        % Positive angle is right turn in direction of motion
        
        % Evenly spaced intervals, roughly one point per degree
        point_interval = track_seg(seg_i,2)/round(track_seg(seg_i,2));
        for ang_i=1:point_interval:abs(track_seg(seg_i,2))
            % Calculate displacement in coordinates of rail segment
            delta_fwd = track_seg(seg_i,1)*sind(ang_i);
            delta_lat = -track_seg(seg_i,1)*(1-cosd(ang_i))*sign(track_seg(seg_i,2));
            
            % Transform to coordinate system of previous segment
            if (current_angle>0)
                new_xy = [
                    cosd(current_angle) sind(current_angle);
                    -sind(current_angle) cosd(current_angle)]*[delta_fwd delta_lat]';
            else
                new_xy = [
                    cosd(abs(current_angle)) -sind(abs(current_angle));
                    sind(abs(current_angle)) cosd(abs(current_angle))]*[delta_fwd delta_lat]';
            end
            
            % Append to spline data by extending spline from previous point
            xy_data = [xy_data;current_end(1)+new_xy(1) current_end(2)+new_xy(2)];
        end
        
        % Add numStCurve station data points
        for st_i = 1:numStCurve
            % Station index
            station_data(num_stations+st_i,1) = num_stations+st_i;
            
            % Calculate displacement in coordinates of rail segment
            delta_fwd = track_seg(seg_i,1)*sind(abs(track_seg(seg_i,2))*st_i/numStCurve);
            delta_lat = -track_seg(seg_i,1)*(1-cosd(track_seg(seg_i,2)*st_i/numStCurve))*sign(track_seg(seg_i,2));
            
            % Transform to coordinate system of previous segment
            if (current_angle>0)
                new_xy = [
                    cosd(current_angle) sind(current_angle);
                    -sind(current_angle) cosd(current_angle)]*[delta_fwd delta_lat]';
            else
                new_xy = [
                    cosd(abs(current_angle)) -sind(abs(current_angle));
                    sind(abs(current_angle)) cosd(abs(current_angle))]*[delta_fwd delta_lat]';
            end
            
            % Append to station data by extending from previous station
            station_data(num_stations+st_i,2) = station_data(num_stations,2)+new_xy(1);
            station_data(num_stations+st_i,3) = station_data(num_stations,3)+new_xy(2);
            
        end
    end
    % Track cumulative angle and endpoint to ensure appended x-y locations are correct
    current_angle=current_angle+track_seg(seg_i,2);
    current_end  = xy_data(end,:);
end

% Add z coordinate to spline (zeros)
rail_spline = [xy_data(1:end-1,:) zeros(size(xy_data,1)-1,1)];

% Remove last station point - repeat of first station
station_data = station_data(1:end-1,:);

