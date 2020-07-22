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

%% 
close all;
%% CORRESPONDING LECTURE FOR PROJECT DESCRIPTION: July 1
%% Geometric Modification
%% 1-a | Special Effect via Compound Linear Geometric Modification
p1a("Images/barbara.raw", 5);
p1a("Images/barbara.raw", 20);

%% 1-b | Spacial Warping
p1b("Images/baboon.raw");

%% Texture Analysis and Modification
%% 2-a | Texture Classification
% Display sample textures
% 1-3  : grass
% 4-6  : brick
% 7-9  : pebbles
% 10-12: fabric
% 13-15: wool
p2("Images/comb1.raw", 5, 3);
% p2("Images/comb2.raw", 4, 3);

%%
img = readraw_color("Images/training.raw");
one = get_subimg(img, 1,1, 84, 72);
imshow(img);
impixelinfo;
%% 3 | Document Processing (Optical Character Recognition)
%% Collecting shape property values from training set
img = readraw_color("Images/training.raw");
img = img(:,:,1);
h = size(img,1);
w = size(img,2);

x_step = 80;
y_step = 72;

% Matrix containing data for each property for each training character
data = zeros(12,7);
for r=1:12
    % Extract the character
    x = mod(c*x_step, w);
    y = int16(r*y_step/h);
    char = get_subimg(img, x, y, x_step, y_step);
    imshow(char);
    % Area
    a = obj_area(char);
    % Perimeter
    p = obj_perim(char);
    % Euler Number
    e = obj_euler_num(char);
    % Circularity
    c = obj_circularity(char);
    % Spatial Moment
    sm = obj_spatial_moment(char);
    % Symmetry
    sym = obj_symmetry(char);
    % Aspect Ratio
    ar = obj_aspect_ratio(char);

    data(
end
%% Performing OCR
p3()
% Use the 7 listed features to analyze the characters and come up with
% classification metrics for characters
% You can use another approach if you want (like edge detection or
% histogram or something for preprocessing)