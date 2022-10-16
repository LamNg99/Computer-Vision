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
  
% Robert Operator Mask
Mx = [1 0; 0 -1];
My = [0 1; -1 0];
  
% Edge Detection Process
% When i = 1 and j = 1, then filtered_image pixel  
% position will be filtered_image(1, 1)
% The mask is of 2x2, so we need to traverse 
% to filtered_image(size(input_image, 1) - 1
%, size(input_image, 2) - 1)
for i = 1:size(double_img, 1) - 1
    for j = 1:size(double_img, 2) - 1
  
        % Gradient approximations
        Gx = sum(sum(Mx.*double_img(i:i+1, j:j+1)));
        Gy = sum(sum(My.*double_img(i:i+1, j:j+1)));
                 
        % Calculate magnitude of vector
        filtered_img(i, j) = sqrt(Gx.^2 + Gy.^2);
         
    end
end

% Displaying Filtered Image
filtered_img = uint8(filtered_img);
figure;
imshow(filtered_img);
  
% Define a threshold value
thresholdValue = 100; % varies between [0 255]
robert_img = max(filtered_img, thresholdValue);
robert_img(robert_img == round(thresholdValue)) = 0;
  
% Displaying Output Image
robert_img = im2bw(robert_img);
figure;
imshow(robert_img); 

