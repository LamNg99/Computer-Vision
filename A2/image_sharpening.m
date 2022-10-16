% Assignment 2
% Part 1
% P3

% Load the original image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A2/images/friends.jpg');

% Displaying Input Image
img = uint8(img);
figure; 
imshow(img); 

% Convert the image to grayscale
gray_img = rgb2gray(img);
figure; 
imshow(gray_img);

% Filter the image with a Gaussian 
% filter with standard deviation of 5
blur_img = imgaussfilt(gray_img, 5);
figure; 
imshow(blur_img);

% Get the mask
mask = gray_img - blur_img;
figure; 
imshow(mask);

% Unsharp masking 
% Set k = 1
k = 1;
um_img = gray_img + k*mask;
figure; 
imshow(um_img);

% High-boost filtering
% Set k = 5
k = 5;
hb_img = gray_img + k*mask;
figure; 
imshow(hb_img);