% Mover created using Simscape Multibody general extrusion
% Copyright 2017-2025 The MathWorks, Inc.

% Sizing parameters
xtm_h = 0.0225*2.8;
xtm_w = 0.0225*2.8;
xtm_l = 0.05;

% Profile of outside surface
xts_mover_extr_o = [...
    -xtm_w/2 -xtm_h/8
    -xtm_w/2 -xtm_h/4
    -xtm_w/4 -xtm_h/2
     xtm_w/4 -xtm_h/2
     xtm_w/2 -xtm_h/4
     xtm_w/2  xtm_h/4
     xtm_w/4  xtm_h/2
    -xtm_w/4  xtm_h/2
    -xtm_w/2  xtm_h/4
    -xtm_w/2  xtm_h/8
    ];

% Full extrusion
xts_mover_extr= [
    xts_mover_extr_o;
    flipud(xts_mover_extr_o*0.9)
    ];

