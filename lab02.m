%% lab :02
%% UI22EC58
% Aim: Take a color image and perform following operation on gray scale image
% (i) Brightness increases or decreases. 
% (ii) Contrast increases or decreases. 
% (iii) Negative image. 
% (iv)Take two colour images,convert them into gray scale images,resize them
% and perform addition,subtraction,multiplication and division operations.
% RAHUL PATEL


%%
% Load a color image
clc
clear all
close all
RGB = imread('peppers.png'); 

% Convert the image to grayscale
I = rgb2gray(RGB);

%Display the Colour image
subplot(1,2,1);
imshow(RGB);
title('Color Image UI22EC58');
% Display the original grayscale image
subplot(1,2,2);
imshow(I);
title('Original Grayscale Image');


%% A) Brightness increase or decrease
brightness_increase = I + 50; % Increase brightness
brightness_decrease = I - 50; % Decrease brightness

figure(2);
title("UI22EC58");
subplot(1,2,1);
imshow(brightness_increase);
title('Brightness Increased');

subplot(1,2,2);
imshow(brightness_decrease);
title('Brightness Decreased');

%% B) Contrast increase or decrease


% Find the minimum and maximum intensity values in the image
minI = double(min(I(:)));
maxI = double(max(I(:)));

% Apply the contrast stretching formula
contrast_increase = uint8(255 * (double(I) - minI) / (maxI - minI));



% Mean value for normalization
meanI = mean(I(:));

% Apply the contrast decreasing formula
contrast_decrease = uint8(meanI + 0.5 * (double(I) - meanI));

figure(3);
subplot(1,2,1);
imshow(contrast_increase);
title('Contrast Increased');

subplot(1,2,2);
imshow(contrast_decrease);
title('Contrast Decreased');

%% C) Negative image
% Calculate the negative of the image
negative_image = 255 - I;

figure(4);
imshow(negative_image);
title('Negative Image UI22EC58');

%% D) Operations on two grayscale images
% Load two color images
RGB1 = imread('rice.png'); % Replace with your actual image file
RGB2 = imread('cameraman.tif'); % Replace with your actual image file

% Convert to grayscale
I1 = im2gray(RGB1);
I2 = im2gray(RGB2);

% Resize the images to the same size
I1_resized = imresize(I1, [256 256]); % Resize to 256x256
I2_resized = imresize(I2, [256 256]); % Resize to 256x256

% Perform addition, subtraction, multiplication, and division
image_addition = imadd(I1_resized, I2_resized);
image_subtraction = imsubtract(I1_resized, I2_resized);
image_multiplication = immultiply(I1_resized, I2_resized);
image_division = imdivide(I1_resized, I2_resized);

% Display the results
figure(5);
subplot(2,2,1);
imshow(image_addition);
title('Image Addition');

subplot(2,2,2);
imshow(image_subtraction);
title('Image Subtraction');

subplot(2,2,3);
imshow(image_multiplication);
title('Image Multiplication');

subplot(2,2,4);
imshow(image_division);
title('Image Division');