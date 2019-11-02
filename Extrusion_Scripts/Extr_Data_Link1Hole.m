function [xy_data] = Extr_Data_Link1Hole(L, W, r)
%Extr_Data_Link1Hole Produce extrusion data for a link with half a hole at one end.
%   [xy_data] = Extr_Data_Link1Hole(L, W, r)
%   This function returns x-y data for a link with half a hole at one end.  
%   You can specify:
%       Length      L
%       Width       W
%       Hole radius r
%
%   To see a plot showing parameter values, enter the name
%   of the function with no arguments
%   >> Extr_Data_Link1Hole

% DEFAULT DATA TO SHOW DIAGRAM
if (nargin == 0)
    L = 10;
    W = 5;
    r = 2;
end

top_xsec = [L/2 W/2; -L/2 W/2];
theta = (90:-1:-90)*pi/180;
semi_hole_xsec = [-L/2+r*cos(theta') r*sin(theta')];
bottom_xsec = [-L/2 -W/2; L/2 -W/2];
xy_data = [ top_xsec; semi_hole_xsec; bottom_xsec];

% PLOT DIAGRAM TO SHOW PARAMETERS AND EXTRUSION
if (nargin == 0)
    % PLOT EXTRUSION
    plot(xy_data(:,1),xy_data(:,2),'b-o','LineWidth',1.5);
    axis('square');
    axis([-6 6 -6 6]);
    
    % SHOW PARAMETERS
    hold on
    
    plot([-L/2 L/2],[0 0],'r-d','MarkerFaceColor','r');
    text(0,0.5,'{\color{red}L}');
    plot([1 1],[-W/2 W/2],'g-d','MarkerFaceColor','g');
    text(1.25,1.5,'{\color{green}W}');
    plot([-L/2 -L/2+r*sin(30*pi/180)],[0 r*cos(30*pi/180)],'k-d','MarkerFaceColor','k');
    text(-4.75,1,'r');

    title(['[xy\_data] = Extr\_Data\_Link1Hole(L, W, r);']);

    hold off
    clear xy_data
end
