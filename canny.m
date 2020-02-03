function outputImage = canny(inputImage, sigma, low, high)

% close all; clear all; clc;

% In = imread('images/lena.png');
input = imread(inputImage);

% Step 1: Smooth the input image with a Gaussian filter
% sigma = 1.4;
Iblur = imgaussfilt(input, sigma, 5);

% Step 2: Compute the gradient magnitude and angle images
[Out, theta] = gradient(Iblur);
theta = arrayfun(@(x)x*180/pi, theta);
direc = arrayfun(@(x)normalize_directions(x), theta);

% Step 3: Apply nonmaxima suppression to the gradient magnitude image
supressed = non_max_supression(Out, direc);

imshow(supressed);

% Step 4: Use double thresholding and connectivity analysis to detect
% and link edges
% low = 0.03;
% high = 0.08;
thresholded = arrayfun(@(x)double_threshold(x,low,high), supressed);
% blobs = grassfire(thresholded);
% result = weak_edges_filter(blobs, thresholded);

outputImage = mat2gray(thresholded);

imwrite(outputImage, 'canny.png');
