function Y_new=polynomial_interp(X,Y,X_new,n)
    m=size(Y,1);
    Y_new=zeros(m,size(X_new,2));
    for i=1:m
        p=polyfit(X,Y(i,:),n);
        Y_new(i,:)= polyval(p,X_new);
    end
end