% Assignment 1
% Part 1
% P.3

% Load the original image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A1/images/AudiR8.jpg');

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Perform power-law transformation on the grayscale image
% Gamma equals to 0.3 
img1 = imadjust(gray_img, [], [], 0.3);

% Gamma equals to 3
img2 = imadjust(gray_img, [], [], 3);

% Equalize the histogram of images
hist_gray = histeq(gray_img, 256);
hist1 = histeq(img1, 256);
hist2 = histeq(img2, 256);

% Display histograms and images before and after equalization
figure;
imshow(gray_img)

figure;
imshow(hist_gray)

figure;
imhist(gray_img)

figure;
imhist(hist_gray, 256)

figure;
imshow(img1)

figure;
imshow(hist1)

figure;
imhist(img1)

figure;
imhist(hist1, 256)

figure;
imshow(img2)

figure;
imshow(hist2)

figure;
imhist(img2)

figure;
imhist(hist2, 256)