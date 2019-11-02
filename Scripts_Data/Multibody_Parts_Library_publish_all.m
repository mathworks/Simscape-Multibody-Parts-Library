cd([SPL_HomeDir '\Scripts_Data\Doc'])
publish_all_html

cd([SPL_HomeDir '\Examples\Extrusions\Basic\html'])
publish_all_html

cd([SPL_HomeDir '\Examples\Extrusions\Conveyors\XTS_1'])
startup_xts_system
bdclose('xts_system');
cd([pwd '\html']);
publish_all_html

cd([SPL_HomeDir '\Examples\Gears\Differential\html'])
publish_all_html

cd([SPL_HomeDir '\Examples\Gears\Simple\html'])
publish_all_html

cd([SPL_HomeDir '\Examples\Gears\Water_Lift'])
startup_sm_water_powered_lift
bdclose all
cd([SPL_HomeDir '\Examples\Gears\Water_Lift\html'])
publish_all_html

cd([SPL_HomeDir '\Examples\Linkages\html'])
publish_all_html


% Copyright 2016-2018 The MathWorks(TM), Inc.
