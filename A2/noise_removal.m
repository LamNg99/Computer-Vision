% Assignment 2
% Part 1
% P4

% Load the original image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A2/images/ottawa.jpg');

% Displaying Input Image
img = uint8(img);
figure; 
imshow(img); 

% Convert the image to grayscale
gray_img = rgb2gray(img);
figure; 
imshow(gray_img);

% Add Gaussian noise with 
% mean = 0, variance = 0.01
noise_img1 = imnoise(gray_img, 'gaussian');
figure; 
imshow(noise_img1);

% mean = 0, variance = 0.1
noise_img2 = imnoise(gray_img, 'gaussian', 0, 0.1);
figure; 
imshow(noise_img2);

% Remove noise by average filter
% Create average filter
h1 = fspecial('average',[5 5]);
h2 = fspecial('average',[7 7]);

% Apply filter to the image
af_img1 = imfilter(noise_img1, h1);
figure; 
imshow(af_img1);

af_img2 = imfilter(noise_img2, h2);
figure; 
imshow(af_img2);

% Remove noise by Gausian filter
gauss_img1 = imgaussfilt(noise_img1, 1);
figure; 
imshow(gauss_img1);

gauss_img2 = imgaussfilt(noise_img2, 5);
figure; 
imshow(gauss_img2);