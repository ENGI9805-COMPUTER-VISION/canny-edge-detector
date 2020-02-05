function [grad_magnitude, grad_direction] = gradient(image)
% Calculate the gradient magnitude and gradient direction of a given image.

kernel_x = [-1 0 1; -2 0 2; -1 0 1];
kernel_y = [1 2 1; 0 0 0; -1 -2 -1];

grad_magnitude_x = conv2(image, kernel_x, 'same');
grad_magnitude_y = conv2(image, kernel_y, 'same');

grad_magnitude = abs(grad_magnitude_x) + abs(grad_magnitude_y);
grad_direction = atan2(grad_magnitude_y, grad_magnitude_x);

end

