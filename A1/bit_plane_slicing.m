% Assignment 1
% Part 1
% P.2

% Load the original image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A1/images/AudiR8.jpg');

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Extract bit-plane
b1 = bitget(gray_img, 1); % Extract 1st bit-plane
b2 = bitget(gray_img, 2); % Extract 2nd bit-plane
b3 = bitget(gray_img, 3); % Extract 3rd bit-plane
b4 = bitget(gray_img, 4); % Extract 4th bit-plane
b5 = bitget(gray_img, 5); % Extract 5th bit-plane
b6 = bitget(gray_img, 6); % Extract 6th bit-plane
b7 = bitget(gray_img, 7); % Extract 7th bit-plane
b8 = bitget(gray_img, 8); % Extract 8th bit-plane

% Show 8 bit-plane slicing results
figure;
imshow(b1*255)

figure;
imshow(b2*255)

figure;
imshow(b3*255)

figure;
imshow(b4*255)

figure;
imshow(b5*255)

figure;
imshow(b6*255)

figure;
imshow(b7*255)

figure; 
imshow(b8*255)

% Reconstruct the image from the highest 2 bit-planes 
reconstructed_img1 = ((2^7)*b8) + ((2^6)*b7);

% Reconstruct the image from the highest 4 bit-planes
reconstructed_img2 = ((2^7)*b8) + ((2^6)*b7) + ((2^5)*b6) + ((2^4)*b5);

figure;
imshow(gray_img)

figure;
imshow(reconstructed_img1)

figure;
imshow(reconstructed_img2)
