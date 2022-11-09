% Assignment 3
% Part 2

% Load a point cloud into the workspace
load("object3d.mat");

% Display the point cloud and label the figure
figure
pcshow(ptCloud)
xlabel("X(m)")
ylabel("Y(m)")
zlabel("Z(m)")

% Set the maximum point-to-sphere 
% distance for sphere fitting to 1cm
maxDistance = 0.01;

% Set the region of interest to constrain the search
roi = [0.3,0.5;0.2,0.4;0.1,0.4];
sampleIndices = findPointsInROI(ptCloud,roi);

% Detect the globe in the point cloud and extract it
[model,inlierIndices] = pcfitsphere(ptCloud,maxDistance,SampleIndices=sampleIndices);
globe = select(ptCloud,inlierIndices);

% Plot the extracted globe
figure
pcshow(globe)




