% Assignment 2
% Part 2

% Enhance Low Light Image using Dehazing Algorithm
% Import an RGB image captured in low light
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A2/images/church1.jpg');
figure; 
imshow(img);

% Invert the image and notice how the low-light
% areas in the original image appear hazy
inverted_img = imcomplement(img);
figure;
imshow(inverted_img);

% Reduce the haze using the imreducehaze function
reduced_img = imreducehaze(inverted_img);
figure;
imshow(reduced_img);

% Invert the results to obtain the enhanced image
enhanced_img = imcomplement(reduced_img);
figure;
imshow(enhanced_img);

% Improve Results Further Using imreducehaze Optional Parameters
reduced_img = imreducehaze(inverted_img, 'Method','approx','ContrastEnhancement','boost');
improved_img = imcomplement(reduced_img);
figure;
imshow(improved_img);

% Improve Results Using Denoising
% Use the imguidedfilter function to remove noise from the enhanced image
denoised_img = imguidedfilter(improved_img);
figure;
imshow(denoised_img);

