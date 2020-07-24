function [ox, oy, wx, wy] = get_control_points(img, corners)
    height = size(img, 1);
    width = size(img, 2);
    
    num_ctrl_pts = 40;

    % Original image reference points
    ox = [ 256; 358; 461; %top first 3
            512; 512; 512; 512; 512 % right
            461; 358; 256; 154; 51; %bottom
            1; 1; 1; 1; 1; % left
            51; 154; ]; % top last 2

    oy = [ 1; 1; 1; %top first 3
            51; 154; 256; 358; 461; % right
            512; 512; 512; 512; 512 %bottom
             461; 358; 256; 154; 51; % left
            1; 1]; % top last 2
        
    % Define Control Point (points in final image) Vectors
    wx = zeros((num_ctrl_pts)/2, 1);
    wy = zeros((num_ctrl_pts)/2, 1);
    
    % Sample n evenly distributed points in a circle around the image
    % n = # polynomial coefficients
    big_dim = max(height, width);
    r = big_dim / 2;
    for i=1:(num_ctrl_pts)/2
        % Start at 0 degrees
        deg = (i-1) * (360/(num_ctrl_pts/2))-90;
        % Set computed point as control point 
        wx(i) = floor(r*cosd(deg)) + big_dim/2 + 1;
        wy(i) = floor(r*sind(deg)) + big_dim/2 + 1;
    end
    
    if corners
        % top left (1,1)
        r = r-100;
        wx((num_ctrl_pts)/2+1) = floor((r+200)*cosd(225)) + big_dim/2 + 1;
        wy((num_ctrl_pts)/2+1) = floor(r*sind(225)) + big_dim/2 + 1;
        % Top right (1,512)
        wx((num_ctrl_pts)/2+2) = floor(r*cosd(315)) + big_dim/2 + 1;
        wy((num_ctrl_pts)/2+2) = floor(r*sind(315)) + big_dim/2 + 1;
        % Bottom Right (512,512)
        wx((num_ctrl_pts)/2+3) = floor((r+200)*cosd(45)) + big_dim/2 + 1;
        wy((num_ctrl_pts)/2+3) = floor(r*sind(45)) + big_dim/2 + 1;
        % Bottom Left (512,1)
        wx((num_ctrl_pts)/2+4) = floor(r*cosd(135)) + big_dim/2 + 1;
        wy((num_ctrl_pts)/2+4) = floor(r*sind(135)) + big_dim/2 + 1;

        % top left (1,1)
        ox((num_ctrl_pts)/2+1) = 1;
        oy((num_ctrl_pts)/2+1) = 1;
        % Top right (1,512)
        ox((num_ctrl_pts)/2+2) = 1;
        oy((num_ctrl_pts)/2+2) = 512;
        % Bottom Right (512,512)
        ox((num_ctrl_pts)/2+3) = 512;
        oy((num_ctrl_pts)/2+3) = 512;
        % Bottom Left (512,1)
        ox((num_ctrl_pts)/2+4) = 512;
        oy((num_ctrl_pts)/2+4) = 1;

        % Create a secondary smaller square and circle map
        for i=1:num_ctrl_pts/2+4
            ox(i+num_ctrl_pts/2+4) = ceil(ox(i)/2)+width/4;
            oy(i+num_ctrl_pts/2+4) = ceil(oy(i)/2)+height/4;
            wx(i+num_ctrl_pts/2+4) = ceil(wx(i)/2)+width/4;
            wy(i+num_ctrl_pts/2+4) = ceil(wy(i)/2)+height/4;
        end
    else     
        for i=1:num_ctrl_pts/2
            ox(i+num_ctrl_pts/2) = ceil(ox(i)/2)+width/4;
            oy(i+num_ctrl_pts/2) = ceil(oy(i)/2)+height/4;
            wx(i+num_ctrl_pts/2) = ceil(wx(i)/2)+width/4;
            wy(i+num_ctrl_pts/2) = ceil(wy(i)/2)+height/4;
        end
    end
