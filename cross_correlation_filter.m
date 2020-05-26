function [output] = cross_correlation_filter(image, template)
%Cross-correlation filter
%   Input: image, template image
%   Output: matrix with cross-correlation score

%converting to grayscale images and casting to type double
    image=double(rgb2gray(image));
    template=double(rgb2gray(template));
%performing cross-correlation on image using template
    %output=conv2(image,template);
    output=xcorr2(image,template);
end

