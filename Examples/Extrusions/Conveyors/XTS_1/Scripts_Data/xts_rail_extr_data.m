% Rail created using Simscape Multibody general extrusion
% Copyright 2017-2019 The MathWorks, Inc.

% General parameters
xts_rail_color = [0.0 0.4 0.8];

% Sizing parameters
xtr_w = 0.07*0.3;
xtr_d = 0.0275*0.3;
xtr_l = 0.005*0.3;

xtr_h = 0.025*0.3;
xtr_t = 0.0225*0.3;

% Rail profile 
xts_rail_extr = [...
    xtr_w*0.5              xtr_t*0.5;
    -xtr_w*0.5              xtr_t*0.5;
    -xtr_w*0.5-xtr_d        xtr_t*0.5+xtr_h;
    -xtr_w*0.5-xtr_d-xtr_l  xtr_t*0.5+xtr_h;
    -xtr_w*0.5-xtr_d-xtr_l -xtr_t*0.5-xtr_h;
    -xtr_w*0.5-xtr_d       -xtr_t*0.5-xtr_h;
    -xtr_w*0.5             -xtr_t*0.5;
    xtr_w*0.5             -xtr_t*0.5;
    xtr_w*0.5+xtr_d       -xtr_t*0.5-xtr_h;
    xtr_w*0.5+xtr_d+xtr_l -xtr_t*0.5-xtr_h;
    xtr_w*0.5+xtr_d+xtr_l  xtr_t*0.5+xtr_h;
    xtr_w*0.5+xtr_d        xtr_t*0.5+xtr_h];

