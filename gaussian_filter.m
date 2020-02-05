function oImg = gaussian_filter(aImg, aSigma, aSize)
% imgaussfilt Gaussian filtering with specific sigma and kernel size

if mod(aSize, 2) == 0
    aSize = aSize+1;
end

kernel = fspecial('gaussian', aSize, aSigma);

oImg = conv2(aImg, kernel, 'same');

end

