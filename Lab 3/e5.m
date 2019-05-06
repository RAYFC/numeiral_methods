warning('off')
close all;
clear all;
load 'light_pca'
Y1 = Y(1:6,:);
% 3 check the difference between polynomial_fit and linear_fit
X_new = linspace(-120,120,52); %52 here means for 4 times frames
Y_p = polynomial_interp(X,Y1,X_new,4); %polinomial fit with degree 4
Y_l = linear_interp(X,Y1,X_new);         %piecewise_liner fit 
figure(1)
for i = 1:6
    subplot(2,3,i)
    hold on 
    plot(X,Y(i,:),'.')
    plot(X_new,Y_p(i,:),'r') 
    plot(X_new,Y_l(i,:),'b')
    hold off
end
pause(); %after comparing. it's hard to tell which kind of interpolation is better 
% 4 5 we omit all after index 6
figure(2)
subplot(2,1,1); %this graph is the reference
for i=1:size(Y,2)  
    I1 = renderim(Y(:,i),B,imsize);
    imshow(I1,[]);
    drawnow;    
    pause(0.05)
end
subplot(2,1,2);
B1 = B(:,1:6); 
for i=1:size(Y_p,2) %in this graph,we have 52 frames rather than 13!!!!!!!
    I1 = renderim(Y_p(:,i),B1,imsize);
    imshow(I1,[]);
    drawnow; 
    pause(0.05)
end
pause();

load 'obj_pca'
Y2=Y(1:15,:); %ignore all the stuff after index 10 to reduce the size.
B2 = B(:,1:15);
X_new = linspace(0,360,4*72);
Y_p = polynomial_interp(X,Y2,X_new,10); %similarly,we use polynomial_fit here
%Y_p = linear_interp(X,Y2,X_new); %This is the option is for linear_interp
figure(3);
subplot(2,1,1);
hold on
for i=1:size(Y,2)
    I1 = renderim(Y(:,i),B,imsize);
    imshow(I1,[]);
    drawnow;    
    pause(0.05)
end
subplot(2,1,2);
for i=1:size(Y_p,2)    %-10 the linear_interp has some potential problems,the last few frames will be error
                        %and I can't figure out why
                            %if we want to have 3 times more images than this one,change Y2 to Y_p
    I2 = renderim(Y_p(:,i),B2,imsize); %ie. change Y2 to Y_p to enable interpolation
    imshow(I2,[]);                      %Y_p to Y2 is unable interpolation
    drawnow;    
    pause(0.05)
end
hold off
pause();

%6
load 'light_pca'
t=2;
n=8;
X3 = [X(:,1:t) X(:,t+n:size(X,2))]; %omit these coefficients in X
Y3 = [Y(:,1:t) Y(:,t+n:size(Y,2))]; %omit these coefficients in Y
X_new = linspace(-120,120,52);
Y_new = polynomial_interp(X3,Y3,X_new,4); %no longer accurate since I have omited some coefficients
figure(4);
subplot(2,1,1);
for i=1:size(Y,2) %reference
    I1 = renderim(Y(:,i),B,imsize);
    imshow(I1,[]);
    drawnow;  
    pause(0.1)
end
subplot(2,1,2);
for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize); %we can easily find out the difference,bad interpolation!!!!!!!!!!
    imshow(Ic)
    drawnow
    pause(0.1)
end
pause();
for i = 1:size(Y,1)
    figure(i+4);
    plot(X,Y(i,:),'r');
    hold on 
    plot(X_new,Y_new(i,:),'b');
    hold off
    pause(0.5)                           %no longer accurate in the middle of 2 lines,since the middle ones are omitted.
end
pause()
close all;
