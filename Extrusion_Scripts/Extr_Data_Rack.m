function [xy_data] = Extr_Data_Rack(pitch, numteeth, Tb, varargin)
% EXTR_DATA_GEAR Produce extrusion data for a involute tooth rack cross-section 
% as a set of vertices. The pressure angle is assumed to be 14.5 deg.
%   [xy_data] = Extr_Data_Rack(pitch, numteeth, Tb, varargin)
%   This function returns x-y data for an involute tooth rack.
%   You can specify:
%       pitch     - Teeth Pitch 
%       numteeth  - Number of teeth
%       Tb        - thickness of base of rack
%       4th Input - Addendum
%       5th Input - Dedendum
% 
% The rack profile is centered about the origin with the origin lying on 
% the pitch line.

% Copyright 2012-2016 The MathWorks, Inc.

Ap = 14.5*pi/180; % Pressure Angle
showplot = 'n';

% DEFAULT DATA TO SHOW DIAGRAM
if (nargin == 0)
    pitch = 1;
    numteeth = 5;
    Tb = 0.5;
end
% CALCULATE DEFAULTS BASED ON REQUIRED PARAMETERS
Ad = pitch/pi;
Dd = 1.157*Ad;

% CHECK IF PLOT REQUESTED OR Ad SPECIFIED
if nargin==4
    if ischar(varargin{1})   % PLOT REQUESTED
        showplot = varargin;
    else
        Ad = varargin{1};    % Ad SPECIFIED
    end
    Dd = 1.157*Ad;           % RECALCULATE Dd DEFAULT
end

% CHECK IF PLOT REQUESTED OR Dd SPECIFIED
if nargin==5
    Ad = varargin{1};       % Ad SPECIFIED
    if ischar(varargin{2})  % PLOT REQUESTED
        showplot = varargin{2};
    else
        Dd = varargin{2};   % Dd SPECIFIED
    end
end

if nargin==6
    Ad = varargin{1};       % Ad SPECIFIED
    Dd = varargin{2};       % Dd SPECIFIED
    if ischar(varargin{3})  % PLOT REQUESTED
        showplot = varargin{3};
    end
end

% Generate single tooth profile
x1 = pitch/4-Dd/tan(pi/2-Ap);
x2 = pitch/4+Ad/tan(pi/2-Ap);
tooth_profile = [0    0; 
                 x1   0;
                 x2   Ad+Dd;
                 pitch-x2 Ad+Dd;
                 pitch-x1 0];
    
% Repeat teeth             
rack_profile = [0 -Tb; tooth_profile];             
for idx=2:numteeth
    tooth_profile(:,1) = tooth_profile(:,1) + pitch; 
    rack_profile = [rack_profile; tooth_profile];
end
rack_profile = [rack_profile; numteeth*pitch 0; numteeth*pitch -Tb];       

% Center rack profile
rack_profile(:,1) = rack_profile(:,1) - numteeth*pitch/2;
rack_profile(:,2) = rack_profile(:,2) - Dd;

xy_data = flipud(rack_profile);

if (nargin == 0 || strcmpi(showplot,'plot'))
    % PLOT EXTRUSION
    plot(xy_data(:,1),xy_data(:,2),'b-o','LineWidth',1.5);
    axis('equal');
    
    % SHOW PARAMETERS
    hold on

    plot([0 0],[0 -Dd],'k-d','MarkerFaceColor','k','MarkerSize',10);
    text(0.1*pitch,-Dd/2,'Dd');

    plot([0 0],[0 Ad],'g-d','MarkerFaceColor','g','MarkerSize',8);
    text(0.1*pitch,Ad/2, '{\color{green}Ad}');

    plot([0 -pitch],[-Dd -Dd],'g-d','MarkerFaceColor','g','MarkerSize',8);
    text(-pitch/2,-3*Dd/2, '{\color{green}pitch}');

    teeth_pts = [0 pitch 2*pitch];
    plot(teeth_pts,(Dd+Ad)*ones(size(teeth_pts)),'r-x','MarkerFaceColor','r');
    text(pitch,Dd+2*Ad,'{\color{red}numteeth}');

	plot([0 0],[-Dd -Dd-Tb],'r-d','MarkerFaceColor','r','MarkerSize',6);
    text(0.1*pitch,-Dd-Tb/2,'{\color{red}Tb}');
    
    title('[xy\_data] = Extr\_Data\_Gear(pitch, numteeth, Tb, (Ad), (Dd));');
    hold off
    
    clear xy_data
end
