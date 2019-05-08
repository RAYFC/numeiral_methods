function [L,U] = myLU(A)
n=length(A);
U=eye(n); %initialize U
L=eye(n); %initialize L
for i = 1:n
    [m,l]=elimMat(U*A,i); %the returned m here is M1,M2,M3.....l is L1,l2..
    U=m*U;                %the U here is M1,M2M1,M3M2M1......
    L=L*l;                %the L returned here is L1,L2L1,L3L2L1.......
end
U=U*A;                      %M=(Mn*.....*M2M1) * A