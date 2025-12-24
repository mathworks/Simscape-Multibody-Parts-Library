% Copyright 2016-2025 The MathWorks(TM), Inc.

cd(fileparts(which('startup_xts_system.m')))
startup_xts_system
bdclose('xts_system');
cd('html');
publish_allCodeForHTML

cd(fileparts(which('sm_open_differential_testrig.slx')))
cd('html');
publish_allCodeForHTML

cd(fileparts(which('sm_bevel_gear_2x_assembly_testrig.slx')))
cd('html');
publish_allCodeForHTML

cd(fileparts(which('startup_sm_water_powered_lift.m')))
startup_sm_water_powered_lift
bdclose all
cd('html');
publish_allCodeForHTML

cd(fileparts(which('sm_links_4bar.slx')))
cd('html');
publish_allCodeForHTML

cd(fileparts(which('sm_pulleys_3pulleys.slx')))
cd('html');
publish_allCodeForHTML

cd(fileparts(which('startup_sm_pulleys_xytable_cross.m')))
startup_sm_pulleys_xytable_cross
bdclose all
cd('html');
publish_allCodeForHTML


function publish_allCodeForHTML
filelist_m=dir('*.m');

filenames_m = {filelist_m.name};

warning('off','Simulink:Engine:MdlFileShadowedByFile');

for i=1:length(filenames_m)
    if ~(strcmp(filenames_m{i},'publish_all_html.m'))
    publish(filenames_m{i},'showCode',false)
    end
end
end