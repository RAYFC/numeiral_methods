close all;
clear all;
%initializing
load 'immotion_basis'
image= imread('ualberta.jpg');
image = im2double(rgb2gray(image));
[Fx,Fy] = gradient(image); %get the gradient of the image
B_new = [image(:) Fx(:) Fy(:)];

imsize1 = size(image);
figure(1);
subplot(2,1,1)
for i=1:size(Y,2)
    I1 = renderim(Y(:,i),B,imsize); 
    imshow(I1,[]);
    drawnow; 
    pause(0.1)
end   
subplot(2,1,2)
for t = -3:.2:3
    Y1=[1;t;t]; %kind of confused here, how do we implement the new y? The sum of all Y1 is new y1.
    I2 = renderim(Y1,B,imsize); 
    imshow(I2,[]);
    drawnow; 
    pause(0.1)
end
pause()
figure(2);
subplot(2,1,1);
for i=1:size(Y,2)
    I3 = renderim(Y(:,i),B_new,imsize1); 
    imshow(I3,[]);
    drawnow; 
    pause(0.1)
end
subplot(2,1,2);
for t = -3:.2:3
    Y2=[1;t;t]; %The sum of all Y2 is new y2.
    I4 = renderim(Y2,B_new,imsize1); 
    imshow(I4,[]);
    drawnow; 
    pause(0.1);
end
%when t is larger values like 5:0.2:10, there is almost no image motion
