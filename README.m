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
p3a();

%%
close all;
data_tr = matfile('OCR_data.mat').data;
data_t1 = matfile('OCR_data_test1.mat').data_t1;
data_t2 = matfile('OCR_data_test2.mat').data_t2;
data = zeros(18,27);
data_ids = [1 2 3 4 5 6 7 8 9 10 11 12 5 12 6 9 11 3 7 12 4 3 2 11 1 10 8];
data(1,:) = data_ids;
data(2:18,:) = [data_tr data_t1 data_t2];
data_chars = ['1','2','3','4','5','6','7','8','9','0','*','.'];

nd = zeros(18,4);
ind1 = data(1,:) ==10;
nd(:,1:2) = data(:,ind1);
ind2 = data(1,:) == 4;
nd(:,3:4) = data(:,ind2);
ind3 = data(1,:) == 6;
nd(:,5:6) = data(:,ind3);
ind4 = data(1,:) == 9;
nd(:,7:8) = data(:,ind4);

% nd = zeros(18,5);
% ind1 = data(1,:) ==1;
% nd(:,1:2) = data(:,ind1);
% ind2 = data(1,:) ==2;
% nd(:,3:4) = data(:,ind2);
% ind3 = data(1,:) ==3;
% nd(:,5:7) = data(:,ind3);
% ind5 = data(1,:) ==5;
% nd(:,8:9) = data(:,ind5);
% ind7 = data(1,:) ==7;
% nd(:,10:11) = data(:,ind7);
% 

% rat_diff = zeros(17,1);
% for i=1:size(data_tr,1)
%     range = max(data_tr(i,:)) - min(data_tr(i,:));
%     six  = data_tr(i,1);
%     nine = data_tr(i,7);
%     rat_diff(i) = (max(six,nine)-min(six,nine))/range;
% end
% rat_diff
% max(rat_diff)

for i=2:size(data,1)
    figure(i);
%     histogram(nd(i,:));
    gscatter(nd(1,:), nd(i,:), nd(1,:));
end
spreadfigures;

%% Testing classification
data_tr = matfile('OCR_data.mat').data;
data_chars = ['1','2','3','4','5','6','7','8','9','0','*','.'];

img = readraw_color("Images/test1.raw");
img = img(:,:,1);
h = size(img,1);
w = size(img,2);

imshow(img);
impixelinfo;

char = img(60:135,164:198);
figure(10);
imshow(char);
features = get_shape_features(char);
% Compare to all data values
min = realmax;
min_char = 0;
for j=1:12
    dist = norm(features - data_tr(:,j), 2);
    if features(3) == data_tr(3,j) && dist < min
        min = dist;
        min_char = j;
    end
end

text_char = data_chars(min_char)
% p3()
% Use the 7 listed features to analyze the characters and come up with
% classification metrics for characters
% You can use another approach if you want (like edge detection or
% histogram or something for preprocessing)