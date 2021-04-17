% Parameters for Water Powered Lift
% Copyright 2017-2021 The MathWorks, Inc.

% Wheel
wrat.wheel.radius = 1;
wrat.wheel.hub.radius = 0.15;
wrat.wheel.hub.length = 0.1;
wrat.wheel.hub.color = [0.6901961 0.49019608 0.27058825];
wrat.wheel.axle_friction = 0.5;
wrat.wheel.rho = 7000;
wrat.wheel.color = [0.6901961 0.49019608 0.27058825];

% Bucket
wrat.bucket.side = 0.225;
wrat.bucket.wall_thickness = 0.0075;
wrat.bucket.rho = 1000;
wrat.bucket.height = 0.1875;

wrat.bucket.hole.side = 0.0375;

wrat.bucket.color = [0.8 0.8 0.8];
wrat.bucket.opacity = 1;
wrat.bucket.pin_friction = 0.008;

% Bracket
wrat.bracket.color = wrat.wheel.color;
wrat.bracket.height = 0.03;
wrat.bracket.thickness = 0.005;
wrat.bracket.bucket_clearance = 0.005;
wrat.bracket.radius = wrat.bucket.side/2+wrat.bracket.bucket_clearance+wrat.bracket.thickness/2;
wrat.bracket.extr_data = [
    wrat.bracket.radius+wrat.bracket.thickness/2  wrat.bracket.height/2;
    wrat.bracket.radius-wrat.bracket.thickness/2  wrat.bracket.height/2;
    wrat.bracket.radius-wrat.bracket.thickness/2 -wrat.bracket.height/2;
    wrat.bracket.radius+wrat.bracket.thickness/2 -wrat.bracket.height/2];
wrat.bracket.side.length = wrat.bucket.height;
wrat.bracket.side.height = wrat.bracket.height;
wrat.bracket.side.thickness = wrat.bracket.thickness;
wrat.bracket.side.color = wrat.wheel.color;

% Spoke
wrat.spoke.length = wrat.wheel.radius-wrat.bucket.height-wrat.bracket.radius; % m
wrat.spoke.radius = wrat.bracket.height/2; % m
wrat.spoke.color = wrat.wheel.color;
wrat.spoke.fill_angles = [0 -45]-144.15;

% Spout
wrat.spout.radius = wrat.bucket.side/2*0.5;
wrat.spout.inner_radius = wrat.bucket.side/2*0.8;
wrat.spout.pipe_length_1 = 0.1;
wrat.spout.pipe_rad = 0.1;
wrat.spout.pipe_length_2 = 0.2;
wrat.spout.rev_data = [
    wrat.spout.radius wrat.spout.pipe_length_2/2;
    wrat.spout.inner_radius wrat.spout.pipe_length_2/2;
    wrat.spout.inner_radius -wrat.spout.pipe_length_2/2;
    wrat.spout.radius -wrat.spout.pipe_length_2/2];
wrat.spout.xc_data = flipud(([sind(1:1:360);cosd(1:1:360)]')*wrat.spout.radius+[wrat.spout.pipe_rad 0]);

wrat.spout.offset_y = wrat.spoke.length+wrat.bracket.radius+wrat.bracket.side.length-wrat.bucket.side/2;
wrat.spout.offset_z = wrat.spoke.length+wrat.bracket.radius+wrat.bracket.side.length;

% Radius used to specify flow rate in Spout subsystem
wrat.spout.water_col.radius = 0.028125;
wrat.spout.water_col.length = wrat.spout.offset_z*0.3*0.63;

% Water
wrat.water.rho = 1000;  % kg/m^3
wrat.water.clr = [0.4 0.8 1.0];
wrat.water.opc = 0.35;
wrat.water.surface_thickness = 0.001;

% Camera
wrat.camera.fixed.offset = [-2 0.2*1.5 0.2*1.5]*wrat.wheel.radius;

% Bevel Gear
wrat.gear.drive.radius = 0.2;
wrat.gear.drive.len = 0.01;
wrat.gear.out.len = 0.01;
wrat.gear.out.radius = 0.05;
wrat.gear.drive.clr = [0.8 0.8 0.8];
wrat.gear.out.clr = [0.0 0.4 0.6];

% Arm Spring
wrat.spring.equilib_pos = 60; % deg
wrat.spring.stiffness   = 2;    % N*m/deg
wrat.spring.damping     = 1.5/5;    % N*m/(deg/s)

% Lead Screw
wrat.screw.lead   = 25e-3;  % m/rev
wrat.screw.radius = 1.5e-2; % m
wrat.screw.length = 0.25;   % m
wrat.screw.muk    = 0.3;    % unitless
wrat.screw.mus    = 0.3;    % unitless

% Clutch
wrat.clutch.rad = 0.1; % m
wrat.clutch.len = 0.01; % m
wrat.clutch.w2trq_gain = 100; % m

% Arm Shaft
wrat.arm_shaft.rad = 0.02; % m
wrat.arm_shaft.len = 0.19; % m

% Gear Shaft
wrat.gear_shaft.rad = 0.02; % m
wrat.gear_shaft.len = 0.19; % m


%tan(wrat.screw.lead/(2*pi*wrat.screw.radius))
