% Assignment 2
% Part 1
% P1

% Load the original image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A2/images/etronGTRS.jpg');

% Displaying Input Image
img = uint8(img);
figure; 
imshow(img); 

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Convert the image to double
double_img = double(gray_img);
  
% Pre-allocate the filtered_image matrix with zeros
filtered_img = zeros(size(double_img));

% Prewitt Operator Mask
Mx = [-1 0 1; -1 0 1; -1 0 1];
My = [-1 -1 -1; 0 0 0; 1 1 1];

% Edge Detection Process
% When i = 1 and j = 1, then filtered_image pixel
% position will be filtered_image(2, 2)
% The mask is of 3x3, so we need to traverse
% to filtered_image(size(input_image, 1) - 2
%, size(input_image, 2) - 2)
% Thus we are not considering the borders.
for i = 1:size(double_img, 1) - 2
	for j = 1:size(double_img, 2) - 2

		% Gradient approximations
		Gx = sum(sum(Mx.*double_img(i:i+2, j:j+2)));
		Gy = sum(sum(My.*double_img(i:i+2, j:j+2)));
				
		% Calculate magnitude of vector
		filtered_img(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
		
	end
end

% Displaying Filtered Image
filtered_img = uint8(filtered_img);
figure;
imshow(filtered_img);
  
% Define a threshold value
thresholdValue = 100; % varies between [0 255]
prewitt_img = max(filtered_img, thresholdValue);
prewitt_img(prewitt_img == round(thresholdValue)) = 0;
  
% Displaying Output Image
prewitt_img = im2bw(prewitt_img);
figure;
imshow(prewitt_img); 