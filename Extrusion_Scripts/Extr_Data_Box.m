function [xy_data] = Extr_Data_Box(box_ox, box_ix, varargin)
%Extr_Data_Box Produce extrusion data for a hollow box.
%   [xy_data] = Extr_Data_Ring(box_ox, box_ix, <box_oy>, <box_iy>)
%   This function returns x-y data for a hollow box.  
%   You can specify:
%       Box outer width(x)              box_ox
%       Box inner width (x)             box_ix
%       (optional) Box outer height (y)	box_oy
%       (optional) Box outer width (y)  box_iy
%
%   To see a plot showing parameter values, enter the name
%   of the function with no arguments
%   >> Extr_Data_Box
%
%   To see a plot created with your parameter values, 
%   add 'plot' as the final argument
%   >> Extr_Data_Box(10,5,'plot')

% Copyright 2013-2016 The MathWorks, Inc.

% DEFAULT DATA TO SHOW DIAGRAM
if (nargin == 0)
    box_ox = 15;
    box_ix = 12;
    box_oy = 10;
    box_iy = 5;
elseif (nargin <= 3)
    box_oy = box_ox;
    box_iy = box_ix;
elseif (nargin > 3)
    box_oy = varargin{1};
    box_iy = varargin{2};
end

if (nargin==0)
    showplot = 'plot';
elseif (nargin==3 || nargin==5)
    showplot = varargin(end);
else
    showplot = 'n';
end

% CALCULATE EXTRUSION DATA
x_signs = [1 -1 -1 1 1]';
y_signs = [1 1 -1 -1 1]';
xy_data = [box_ox*x_signs box_oy*y_signs;box_ix*y_signs box_iy*x_signs];
    

% PLOT DIAGRAM TO SHOW PARAMETERS AND EXTRUSION
if (nargin == 0 || strcmpi(showplot,'plot'))
    
    % GET MAX AXIS DIMENSION
    maxd = max(box_ox,box_oy);
    % PLOT EXTRUSION
    plot(xy_data(:,1),xy_data(:,2),'b-o','LineWidth',1.5);
    axis('square');
    axis([-1.1 1.1 -1.1 1.1]*maxd);
    
    % SHOW PARAMETERS
    hold on
        
    plot([0 box_ox],[0 0],'r-d','MarkerFaceColor','r');
    text(0.5*box_ox,0.05*maxd,'{\color{red}box\_ox}');

    plot([0 box_ix],[0.5*box_iy 0.5*box_iy],'b-d','MarkerFaceColor','b');
    text(0.5*box_ix,0.06*maxd+0.5*box_iy,'{\color{blue}box\_ix}');
    
    plot([0 0],[0 -box_oy],'g-d','MarkerFaceColor','g');
    text(-0.3*maxd,-0.8*box_oy,'{\color{green}box\_oy}');

    plot([-0.5*box_ix -0.5*box_ix],[0 box_iy],'k-d','MarkerFaceColor','k');
    text(-0.5*box_ix+0.06*maxd,0.8*box_iy,'{\color{black}box\_iy}');
    
	title(['[xy\_data] = Extr\_Data\_Box(box\_ox, box\_ix, <box\_oy, box\_iy>);']);
    hold off
    clear xy_data
end
