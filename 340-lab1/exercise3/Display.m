function Display(A,B,imsize,k)
    [~,n]=size(B);     %How many columns does B have
    for i=1:n
        [L,U] = lu(A);           %solve the equation bu Lu decompistion.
        x=U\(L\B(:,i));        %mentioned in the web,every column of B was a full scan, 
        C=reshape(x,imsize)'; %reshape the result and transpose.
        figure(k);         %indicate which figure should be drawn
        subplot(1,n,i); %divide the graph into 1*n areas, and draw on the i-th area.
        imshow(C);
    end
end