%Histogram Equalisation of Image
%Created by Darpan Sarode
clc;
clear all;
close all;
%Show a Orignal image  
I=imread('Lenna.jpg');
RGB=rgb2gray(I);                          %Convert a RGB image to gray scale         

[rows,columns]=size(RGB);

pixelNumber=rows*columns;                 %Define a number of pixel 
frequncy=zeros(822,1);                    %Variable define    
pdf=zeros(822,1);
cdf = zeros(822,1);
cummlative = zeros(822,1);
outpic = zeros(822,1);
finalResult = uint8(zeros(rows,columns));

%To calculate a number of count of pixel and its respective probability
for i = 1:1:rows
    for j = 1:1:columns
        val = RGB(i,j);
        frequncy(val+1) = frequncy(val+1)+1;
        pdf(val+1) = frequncy(val+1)/pixelNumber;
    end
end


sum =0 ;
%we want the 256 - 1 that's why we initailzed the intensityLevel with 255
%instead of 256
intensityLevel = 255;

for i = 1:1:size(pdf)
    sum =sum +frequncy(i);
    cummlative(i) = sum;
    cdf(i) = cummlative(i)/ pixelNumber;
    outpic(i) = round(cdf(i) * intensityLevel);
end


for i = 1:1:rows
    for j = 1:1:columns
        finalResult(i,j) = outpic(RGB(i,j) + 1);
    end
end

%Display Histogram Equalised image and histogram 
%% Plotting Histogram of test as well as equalized image

% Plotting histogram of test image
figure('Name','Histogram of test as well as equalized image');
subplot(121);
imhist(RGB);
title('Histogram of test image');

% Plotting histogram of Histogram Equalized Image
subplot(122);
imhist(finalResult);
title('Histogram of Histogram Equalized Image');

suptitle('Plotting Histogram of test as well as equalized image');

%% Displaying test as well as equalized image without using Built-in Command

% Displaying test image 
figure('Name','Histogram Equalization without built-in command');
subplot(121);
imshow(RGB);
title('Original Image');

% Displaying Histogram Equalized Image
subplot(122);
imshow(finalResult);
title('Histogram Equalized Image');

suptitle('Histogram Equalization without using Built-in Command');

%% Histogram Equalization using Built-in Command

figure('Name','Histogram Equalization using Built-in Command');
subplot(121);
imshow(RGB);
title('Original Test Image');

subplot(122);
histeq(RGB);
title('Histogram Equalized Image');

suptitle('Histogram Equalization using Built-in Command');