close all;
clear all;
load 'EllipsePoints'
%get the mean of 3 groups
m_Y1 = mean(Y1,2);
m_Y2 = mean(Y2,2);
m_Y3 = mean(Y3,2);

% find out the centers of the 3 groups
new_Y1 = Y1 - m_Y1 * ones(1,size(Y1,2));   
new_Y2 = Y2 - m_Y2 * ones(1,size(Y2,2));
new_Y3 = Y3 - m_Y3 * ones(1,size(Y3,2));

%the empirical covariance matrix
C1 = new_Y1 * new_Y1' / size(Y1,2);
C2 = new_Y2 * new_Y2' / size(Y2,2);
C3 = new_Y3 * new_Y3' / size(Y3,2);

%plot all points
hold on
plot(Y1(1,:),Y1(2,:),'.b')
plot(Y2(1,:),Y2(2,:),'.b')
plot(Y3(1,:),Y3(2,:),'.b')
axis equal

%1st part
%we have to remenber to shift the result we got.
%also, in the graph,the eigenvalue is 2^sqrt times than it was
[X1,D1] = eig(C1);
D1 = 2*sqrt(D1);
plot(D1(1,1)*[0 X1(1,1)]+m_Y1(1),D1(1,1)*[0 X1(2,1)]+m_Y1(2),'r') %the first eigenvalue
plot(D1(2,2)*[0 X1(1,2)]+m_Y1(1),D1(2,2)*[0 X1(2,2)]+m_Y1(2),'g') %the second eigenvalue

%2nd part

[X2,D2] = eig(C2);
D2 = 2*sqrt(D2);
plot(D2(1,1)*[0 X2(1,1)]+m_Y2(1),D2(1,1)*[0 X2(2,1)]+m_Y2(2),'r')
plot(D2(2,2)*[0 X2(1,2)]+m_Y2(1),D2(2,2)*[0 X2(2,2)]+m_Y2(2),'g')

%3rd part
[X3,D3] = eig(C3);
D3 = 2*sqrt(D3);
plot(D3(1,1)*[0 X3(1,1)]+m_Y3(1),D3(1,1)*[0 X3(2,1)]+m_Y3(2),'r')
plot(D3(2,2)*[0 X3(1,2)]+m_Y3(1),D3(2,2)*[0 X3(2,2)]+m_Y3(2),'g')

hold off
