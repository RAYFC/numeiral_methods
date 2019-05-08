function [M,L] = elimMat(A,k)
n=length(A);
a=A(:,k);
m=zeros(1,n);%set up m
m=m';%Transpose m
for i=k+1:n
    m(i,1)=a(i,:)/a(k,:);  %mi=ai/ak i=k+1,....,n.
end
I=eye(n); %Create the n x n identity matrix
e=I(:,k); %e is the k-th colum of Identity matrix. i.e:ek.
M=I-m*(e');% follow the routine offered at page 68,testbook
L=inv(M);  % or L+I+m*(e')



