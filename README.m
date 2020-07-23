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
chars = segment_chars(img);

% Matrix containing data for each property for each training character
data = zeros(16,12, 'double');
for i=1:12
    % Extract the character
    char = chars(:,:,i);
%     data(:,i) = get_shape_features(char);
    text_char = OCR_classify(char)
end

save('OCR_data.mat', 'data');

%% Performing OCR on Test Sets
img = readraw_color("Images/cwru.raw");
img = img(:,:,1);
img = to_binary(img)*255;

figure(2);
imshow(img);
impixelinfo;

text_chars = OCR_classify(img)


%% Testing classification
data = matfile('OCR_data.mat').data;
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
    dist = norm(features - data(:,j), 2);
    if features(3) == data(3,j) && dist < min
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
%%
close all;
data = matfile('OCR_data.mat').data;
data_chars = ['1','2','3','4','5','6','7','8','9','0','*','.'];
% for i=1:12
%    data(17,i) = i;
% end
for i=1:16
    figure(i);
    plot(data(i,1:10));
end
spreadfigures;
