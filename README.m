% EECS 490 HW3
% July 24, 2020
% Name: Tucker Guen
% NetworkID: tkg11
% Email: tkg11@case.edu

% Note: The directory structure should be:
% > project_dir
%       > Images
%       src_file1.m
%       src_file2.m
%       . . .


%% CORRESPONDING LECTURE FOR PROJECT DESCRIPTION: July 1
%% Geometric Modification
%% 1-a | Special Effect via Compound Linear Geometric Modification
p1a("Images/barbara.raw", 5);
p1a("Images/barbara.raw", 20);

%% 1-b | Spacial Warping
p1b("Images/baboon.raw");
% You have to figure out for yourself what the transformation and anchor
% points are

%% Texture Analysis and Modification
%% 2-a | Texture Classification
p2a();
% You should be able to have your algorithm classify them in kind of the
% same way as you do

%% 2-b | Texture Segmentation
p2b()
% You can use kmeans() in matlab
% Goal is to draw line separating the textures
%% 3 | Document Processing (Optical Character Recognition)
p3()
% Use the 7 listed features to analyze the characters and come up with
% classification metrics for characters
% You can use another approach if you want (like edge detection or
% histogram or something for preprocessing)