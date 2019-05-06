close all;
clear all;
load 'sincos_basis'
freq = 2; %the larger the freq is,the graph will move faster
y = [sin(freq*asin(Y(1,:))) ; cos(freq*acos(Y(2,:)))];
b = [sin(freq*asin(B(:,1))) cos(freq*acos(B(:,2)))];

for i=1:size(Y,2) %the number of frames
    %this is the original graoh
    I1 = renderim(Y(:,i),B,imsize); 
    subplot(3,1,1)
    imshow(I1,[]); 
    drawnow; 
    %modified y,make it faster
    I2 = renderim(y(:,i),B,imsize); 
    subplot(3,1,2)
    imshow(I2,[]); 
    drawnow; 
    %modified b, make more columns
    I3 = renderim(Y(:,i),b,imsize); 
    subplot(3,1,3)
    imshow(I3,[]); 
    drawnow; 
    pause(0.1);

end
