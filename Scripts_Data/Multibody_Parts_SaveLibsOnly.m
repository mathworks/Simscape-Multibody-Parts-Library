% Code to create copy of Simscape Multibody Parts Library
% that excludes all examples and testing files
% Resulting folder SPL_Copy can be copy/pasted
% into other projects.
%
% Copyright 2014-2019 The MathWorks, Inc.

folder_list = {...
    'Extrusion_Scripts',...
    'Libraries'};

file_list = {...
    'README.txt',...
    'startup_sm_parts.m'};

copyFolderName = 'SPL_Libs';
mkdir(copyFolderName)

for i= 1:length(folder_list)
    copyfile(folder_list{i},[copyFolderName filesep folder_list{i}]);
end

for i= 1:length(file_list)
    copyfile(file_list{i},[copyFolderName filesep file_list{i}]);
end

% Move to folder
cd(copyFolderName)

%% Delete PowerPoint files
pptxFullList = dir('**/*.pptx');
for ppt_i=1:length(pptxFullList)
    delstr = [pptxFullList(ppt_i).folder '\' pptxFullList(ppt_i).name]; 
    disp(delstr);
    delete(delstr)
end
