%implement the sample testcase from the textbook
A=[1,2,2;4,4,2;4,6,4];
b=[3;6;10];
%Do LU decompistion
[L,U]=myLU(A);
%Ly=b, to get y, do the forward substution
y=fwdSubst(L,b);
%Ux=y, to get x, do the backward substution
x=backSubst(U,y);
%display x
disp(x);


