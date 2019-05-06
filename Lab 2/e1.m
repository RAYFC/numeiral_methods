%innitiallizing
warning("off");
m1= [0.5,1,2,3];
n = 10; 
for i=1:4
    m=m1(i); 
    x = 0:0.5:m*pi;
    y=sin(x);
%Part1 
    y = polynomial_interp(x,y,x,n);
    error = norm(y-sin(x));
    string1=['error for original sample Xs of m=' , num2str(m), ' n=' ,num2str(n), ' is ',num2str(error)];
    disp(string1);

%part2 
    x_new = 0:0.1:2^(1/n)*m*pi;
    y_new = polynomial_interp(x,y,x_new,n);
    error_new = norm(y_new-sin(x_new));
    string2=['error for denser sample Xs of m=' , num2str(m),' n=' ,num2str(n), ' is ',num2str(error_new)];
    disp(string2);

%plot part1
%plot (x,sin(x));
%hold on
%plot part2
    subplot(2,2,i);
    plot (x_new,y_new,'r');
    hold on
%plot sinx
    x = 0:0.01:m*pi;
    plot (x,sin(x),'b');
    hold off
%labeling
    xlabel('X');
    ylabel('Y');
end   
