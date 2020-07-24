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

%% Geometric Modification
%% 1-a | Special Effect via Compound Linear Geometric Modification
%% 1-2 Embedded image
% M-file name: p1a.m
% Usage: p1a(img_name_string, t)
% Output image: "Images/OUT_p1a_" + t + "_" + img_name_string
% Parameters: time value t
p1a("Images/barbara.raw", 5);
p1a("Images/barbara.raw", 20);

%% 1-b | Spacial Warping
% M-file name: p1b.m
% Usage: p1a(img_name_string, poly-warp or disk-map)
% Output image: "Images/OUT_p1b_warped" + img_name_string
%               "Images/OUT_p1b_unwarped" + img_name_string                
% Parameters: True to use polynomial warping, false to use square to disk
% map
p1b("Images/baboon.raw", true);
%% Texture Analysis and Modification
%% 2-a | Texture Segmentation
% M-file name: p2.m
% Usage: p2(img_name_string, k, W)
% Output image: "Images/OUT_p2_segmented" + img_name
%               "Images/OUT_p2_cleaned" + img_name
% Parameters: k = number of classes (textures) in image
%             W = window size for neighborhood stddev
p2("Images/comb1.raw", 5, 20);
p2("Images/comb2.raw", 4, 11);
%% Document Processing (Optical Character Recognition)
%% 3-a | Running OCR on training set and two test sets
% M-file name: p4a.m
% Usage: p3a()
% Output image: None, text characters displayed with images
% Parameters: none
p3a();
%% 3-b | Running OCR on cwru.raw
% M-file name: p4a.m
% Usage: p4a()
% Output image: None, text characters displayed with images
% Parameters: none
p4a();