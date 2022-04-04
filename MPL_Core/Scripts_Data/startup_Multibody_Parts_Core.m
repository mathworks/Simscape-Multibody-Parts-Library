function startup_Multibody_Parts_Core
% Startup function for project Multibod_Parts_Core.prj
% Copyright 2014-2022 The MathWorks, Inc.

MPL_libname = 'Multibody_Parts_Lib';
load_system(MPL_libname);
disp(get_param(MPL_libname,'Description'));
which(MPL_libname)

tempNumMPL = which(MPL_libname,'-all');
if (length(tempNumMPL)>1)
    tempMPLwarnStr = sprintf('Multiple copies of the Simscape Multibody Parts Library are on the MATLAB path. It is recommended you only have one copy on your path. Please consider adjusting your MATLAB path so that only one copy is present.\n\nLocations of Simscape Multibody Parts Library on your path:\n');
    tempMPLLibStr = sprintf('%s\n',tempNumMPL{:});
    warning([tempMPLwarnStr tempMPLLibStr])
end

% Only open overview if this is the top level project
% Do not open if this is a Reference Projects
curr_proj = simulinkproject;
if(curr_proj.Information.TopLevel)
   web('Multibody_Parts_Library_Overview.html');
end