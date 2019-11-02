function [xy_data] = Extr_Data_Cam(rad1, rad2, d, varargin)
%Extr_Data_Cam Produce extrusion data for a ring.
%   [xy_data] = Extr_Data_Cam(rad1, rad2, d)
%   This function returns x-y data for a cam formed from two circles
%   that are connected by lines tangent to the circles.
%
%   You can specify:
%       Radius, circle 1                rad1
%       Radius, circle 2                rad2
%       Distance between circle centers	d
%
%   To see a plot showing parameter values, enter the name
%   of the function with no arguments
%   >> Extr_Data_Cam
%
%   To see a plot created with your parameter values, 
%   add 'plot' as the final argument
%   >> Extr_Data_Cam(5,3,4,'plot')

% Copyright 2012-2016 The MathWorks, Inc.

% DEFAULT DATA TO SHOW DIAGRAM
if (nargin == 0)
    rad1 = 5;
    rad2 = 3;
    d = 4;
end

% CHECK IF PLOT SHOULD BE PRODUCED
if (isempty(varargin))
    showplot = 'n';
else
    showplot = varargin;
end

% CALCULATE ANGLE FOR EXTERNAL TANGENT
theta1 = acos((rad1-rad2)/d)*180/pi;

% CALCULATE EXTRUSION DATA
% CIRCLE FOR RAD1
theta_r1 = [(theta1:1:360-theta1)]'*pi/180;
unit_circle = [cos(theta_r1), sin(theta_r1)];
%if(ring_ir>0)
%    xy_data = [ring_or * unit_circle; ring_ir * flipud(unit_circle)];
%else
    xy_data1 = [rad1 * unit_circle];
%end

% CIRCLE FOR RAD2
theta_r2 = [(-theta1:1:theta1)]'*pi/180;
unit_circle = [cos(theta_r2), sin(theta_r2)];
%if(ring_ir>0)
%    xy_data = [ring_or * unit_circle; ring_ir * flipud(unit_circle)];
%else
    xy_data2 = [rad2 * unit_circle]+repmat([d 0],size(unit_circle,1),1);

    xy_data = [xy_data1;xy_data2];
% PLOT DIAGRAM TO SHOW PARAMETERS AND EXTRUSION
if (nargin == 0 || strcmpi(showplot,'plot'))
    % PLOT EXTRUSION
    plot(xy_data(:,1),xy_data(:,2),'b-o','LineWidth',1.5);
    axis('square');
    axis([-rad1 d+rad2 [-1 1]*(rad1+d+rad2)/2]*1.1);
    
    % SHOW PARAMETERS
    hold on
	plot([0 d],[0 0],'k-d','MarkerFaceColor','k','MarkerSize',10);
    text(d/2,0.1*max(rad1,rad2),'d');

    plot([d d+rad2*cos(theta1*pi/180)],[0 rad2*sin(theta1*pi/180)],'r-d','MarkerFaceColor','r');
    text(d+rad2*cos(theta1*pi/180)/2,rad2*sin(theta1*pi/180)/2,'{\color{red}rad2}');

	plot([0 rad1*cos(theta1*pi/180)],[0 rad1*sin(theta1*pi/180)],'g-d','MarkerFaceColor','g');
    text(rad1*cos(theta1*pi/180)/2,rad1*sin(theta1*pi/180)/2,'{\color{green}rad1}');

    title(['[xy\_data] = Extr\_Data\_Cam(rad1, rad2, d1);']);
    hold off
    clear xy_data
end
