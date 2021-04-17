% Copyright 2016-2021 The MathWorks(TM), Inc.

cd(fileparts(which('sm_parts_test_tube_box.slx')))
cd('html');
publish_allCodeForHTML

cd(fileparts(which('sm_common_gear_assembly_testrig.slx')))
cd('html');
publish_allCodeForHTML

cd(fileparts(which('Multibody_Parts_Library_Gear_Asy_Overview.m')))
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