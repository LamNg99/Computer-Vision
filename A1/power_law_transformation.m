% Assignment 1

% P.1

% Load the original image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A1/images/AudiR8.jpg');

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Perform power-law transformation on the grayscale image
% Gamma equals to 0.3 
img1 = imadjust(gray_img, [], [], 0.3);

% Gamma equals to 3
img2 = imadjust(gray_img, [], [], 3);

% Display results
figure;
imshow(gray_img)

figure;
imshow(img1)

figure;
imshow(img2)
