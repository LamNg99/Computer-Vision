% Assignment 2
% Part 2

% Another Example of Improving Poorly Lit Image
% Import an RGB image captured in low light
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A2/images/church2.jpg');
img = imrotate(img, 90);
figure; 
imshow(img);

% Invert the image and notice how the low-light
% areas in the original image appear hazy
inverted_img = imcomplement(img);

% Reduce the haze using the imreducehaze function
reduced_img = imreducehaze(inverted_img, 'ContrastEnhancement', 'none');

% Invert the results to obtain the enhanced image
enhanced_img = imcomplement(reduced_img);
figure;
imshow(enhanced_img);

% Reduce Color Distortion by Using Different Color Space
% Convert the input image from the RGB colorspace to the L*a*b* colorspace
Lab = rgb2lab(img);

% Invert the L*a*b* image
LInv = imcomplement(Lab(:,:,1) ./ 100);

% Dehaze the inverted image using the imreducehaze function
LEnh = imcomplement(imreducehaze(LInv,'ContrastEnhancement','none'));

% Increase the saturation
LabEnh(:,:,1)   = LEnh .* 100;
LabEnh(:,:,2:3) = Lab(:,:,2:3) * 2; % Increase saturation

% Convert the image back to an RGB image
AEnh = lab2rgb(LabEnh);
figure;
imshow(AEnh);

% Estimate Illumination Map
% Apply the dehazing algorithm to the image
[BInv,TInv] = imreducehaze(inverted_img,'Method','approxdcp','ContrastEnhancement', 'none');

% Invert the enhanced image
T = imcomplement(TInv);
figure;
imshow(T)
colormap(hot)