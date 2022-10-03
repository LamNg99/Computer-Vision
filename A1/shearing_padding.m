% Assignment 1
% Part 2 

% Step 1: Transform an Image Using Simple Shear
% Set a value
a = 0.45;
% Construct an affine tform struct using maketform
T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );

% Load and display image
img = imread('/Users/lamnguyen/Desktop/School/Computer-Vision/A1/images/bear.jpg');
h1 = figure;
imshow(img)
title('Original Image')

% Choose a shade of orange as our fill value
orange = [255 127 0]';

% Perform shearing
R = makeresampler({'cubic','nearest'},'fill');
sheared_img = imtransform(img,T,R,'FillValues',orange);
h2 = figure; 
imshow(sheared_img);
title('Sheared Image');

% Step 2: Explore the Transformation
[U,V] = meshgrid(0:1008:4032,0:1008:3024);
[X,Y] = tformfwd(T,U,V);
yellow = [1 1 0];

figure(h1);
hold on;
line(U, V, 'Color',yellow);
line(U',V','Color',yellow);

figure(h2);
hold on;
line(X, Y, 'Color',yellow);
line(X',Y','Color',yellow);

% Do the same thing with an array of circles
for u = 0:1008:4032
    for v = 0:1008:3024
        theta = (0 : 504)' * (2 * pi / 504);
        uc = u + 252*cos(theta);
        vc = v + 252*sin(theta);
        [xc,yc] = tformfwd(T,uc,vc);
        figure(h1); line(uc,vc,'Color',yellow);
        figure(h2); line(xc,yc,'Color',yellow);
    end
end

% Step 3: Compare the 'fill', 'replicate', and 'bound' Pad Methods
% 'fill' Pad Method
R = makeresampler({'cubic','nearest'},'fill');
Bf = imtransform(img,T,R,'XData',[-500 6000],'YData',[-500 5000],...
                 'FillValues',orange);

figure;
imshow(Bf);
title('Pad Method = ''fill''');

% 'replicate' Pad Method
R = makeresampler({'cubic','nearest'},'replicate');
Br = imtransform(img,T,R,'XData',[-500 6000],'YData', [-500 5000]);

figure;
imshow(Br);
title('Pad Method = ''replicate''');

% 'bound' Pad Method
R = makeresampler({'cubic','nearest'}, 'bound');
Bb = imtransform(img,T,R,'XData',[-500 6000],'YData',[-500 5000],...
                 'FillValues',orange);
figure;
imshow(Bb);
title('Pad Method = ''bound''');

% Compare 'fill' and 'bound' Pad Method
R = makeresampler({'cubic','nearest'},'fill');
Cf = imtransform(img,T,R,'XData',[5383 5399],'YData',[3014 3029],...
                 'FillValues',orange);

R = makeresampler({'cubic','nearest'},'bound');
Cb = imtransform(img,T,R,'XData',[5383 5399],'YData',[3014 3029],...
                 'FillValues',orange);

Cf = imresize(Cf,12,'nearest');
Cb = imresize(Cb,12,'nearest');

figure;
imshow(Cf); 
title('Pad Method = ''fill''');

figure;
imshow(Cb); 
title('Pad Method = ''bound''');

% Step 4: Exercise the 'circular' and 'symmetric' Pad Methods
% 'circular' Pad Method
Thalf = maketform('affine',[1 0; a 1; 0 0]/2);

R = makeresampler({'cubic','nearest'},'circular');
Bc = imtransform(img,Thalf,R,'XData',[-500 6000],'YData',[-500 5000],...
                 'FillValues',orange);
figure;
imshow(Bc);
title('Pad Method = ''circular''');

% 'symmetric' Pad Method
R = makeresampler({'cubic','nearest'},'symmetric');
Bs = imtransform(img,Thalf,R,'XData',[-500 6000],'YData',[-500 5000],...
                 'FillValues',orange);
figure;
imshow(Bs);
title('Pad Method = ''symmetric''');