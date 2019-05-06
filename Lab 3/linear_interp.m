function Y_new=linear_interp(X,Y,X_new)
    m=size(Y,1);
    Y_new=zeros(m,size(X_new,2));
    for i=1:m
        Y_new(i,:)= interp1(X,Y(i,:),X_new);
    end
end