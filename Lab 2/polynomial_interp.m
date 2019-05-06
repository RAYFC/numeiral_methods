function y_new = polynomial_interp(X,y,x,n)
p = polyfit(X,y,n);
y_new=polyval(p,x);
   