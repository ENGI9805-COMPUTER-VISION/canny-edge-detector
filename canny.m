function outputImage = canny(inputImage, sigma, low, high)
% Implementation of Canny edge detector in matlab

% Read a grayscale image from the file
% In = imread('images/lena.png');
input = imread(inputImage);

% Step 1: Smooth the input image with a Gaussian filter
% recommend sigma value: 1.4
blurImage = imgaussfilt(input, sigma, 5);

% Step 2: Compute the gradient magnitude and angle images
[magnitude, direction] = gradient(blurImage);
direction = arrayfun(@(x)x*180/pi, direction);
direc = arrayfun(@(x)normalize_directions(x), direction);

% Step 3: Apply nonmaxima suppression to the gradient magnitude image
supressedImage = non_max_supression(magnitude, direc);

% Step 4: Use double thresholding and connectivity analysis to detect
% and link edges
% recommend low value: 0.03
% recommend high value: 0.08
thresholdedImage = arrayfun(@(x)double_threshold(x,low,high), supressedImage);
% blobs = grassfire(thresholded);
% result = weak_edges_filter(blobs, thresholded);

% Convert matrix to intensity image
outputImage = mat2gray(thresholdedImage);

% Display image
imshow(supressedImage);

%  Write image to graphics file
imwrite(outputImage, 'result.png');
