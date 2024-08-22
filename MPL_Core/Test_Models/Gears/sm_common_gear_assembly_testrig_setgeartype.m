function sm_common_gear_assembly_testrig_setgeartype(modelname,geartype)
% Adjust settings of gear assembly to show external and internal gears
% Copyright 2017-2024 The MathWorks, Inc.

blkname = [modelname '/Common Gear Assembly'];

if(strcmpi(geartype,'External'))
    set_param(blkname,...
        'f_popup_gear_type','External',...
        'f_gear_rht','0.01',...
        'f_mark_radius_range','[0.7 0.8]');
else
    set_param(blkname,...
        'f_popup_gear_type','Internal',...
        'f_gear_rht','0.02',...
        'f_mark_radius_range','[1.15 1.2]');
end

    
    
    
