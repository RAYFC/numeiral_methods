close all;
clear all;
% Read images

tumor = imread('tumor.jpg');
contour = imread('tumorContour.jpg');
[X,Y] = find(contour > 250);

%show the image

imshow(tumor);
hold on;

%get the imput and store them
[x,y] = ginput;
n=size(x,1);
%spline!
t=[];
t(1)=norm([x(1),y(1)]);
x(n+1)=x(1);
y(n+1)=y(1);
for i=2:n+1
    t(i)=norm([x(i),y(i)]-[x(i-1),y(i-1)])+t(i-1);
end
p1 = griddedInterpolant(t,x,'spline');
p2 = griddedInterpolant(t,y,'spline');
xq = linspace(t(1),t(n+1),200);
x1 = p1(xq);
y1 = p2(xq);
plot(x1,y1,'b');
plot(x,y,'.r');
%get the error
%find the indice of the nearest point
indice=dsearchn([X,Y],[x,y]);
least_error=norm(X(indice)-[x,y])