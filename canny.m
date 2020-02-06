function outputImage = canny(inputImage, sigma, low, high)
% Implementation of Canny edge detector in matlab

% Read a grayscale image from the file
% In = imread('images/lena.png');
input = imread(inputImage);

% Step 1: Smooth the input image with a Gaussian filter
% recommend sigma value: 6
blurImage = gaussian_filter(input, sigma, 5);

% Step 2: Compute the gradient magnitude and angle images
[magnitude, direction] = sobel_gradient(blurImage);
direction = arrayfun(@(x)x*180/pi, direction);
direct = arrayfun(@(x)normalize_directions(x), direction);

% Step 3: Apply nonmaxima suppression to the gradient magnitude image
supressedImage = nonmaxima_supression(magnitude, direct);

% Step 4: Use double thresholding and connectivity analysis to detect
% and link edges
% recommend low value: 0.18
% recommend high value: 0.26
thresholdedImage = arrayfun(@(x)double_threshold(x,low,high), supressedImage);

% Convert matrix to intensity image
outputImage = mat2gray(thresholdedImage);

% Display image
imshow(outputImage);

%  Write image to graphics file
imwrite(outputImage, 'result.png');
