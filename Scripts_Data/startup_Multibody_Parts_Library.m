function startup_Multibody_Parts_Library

% Copyright 2012-2021 The MathWorks, Inc.

% Only open overview if this is the top level project
% Do not open if this is a Reference Project
curr_proj = simulinkproject;
if(curr_proj.Information.TopLevel)
    % Only open documentation if it exists
    if (exist('Multibody_Parts_Library_Demo_Script.html','file'))
        web('Multibody_Parts_Library_Demo_Script.html');
    end
end
