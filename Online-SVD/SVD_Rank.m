p = 8;    
%row

q = 10;
%column

rank = 35;
%rank

X = rand([p q]);
%given matric

[U,S,V] = svd(X);
%SVD of given matrix x  

% b = 11x1 Zero Matrix
% b[11] = 1
b = zeros([(q+1) 1]);
b(q+1) = 1;

% For calculating 35 rank error we are taking 35 zero vector
err = zeros(1, rank);

for i=1:rank
    a = rand([p 1]);
    [Un, Sn, Vn] = Rank1(U,S,V,a,b);     
    U=Un;
    S=Sn;
    V=Vn;
    X = [X zeros(size(X,1), 1)] + a*b';   
    b = [0 b'];
    b = b';
    Xn = Un*Sn*Vn';
    err(i) = norm(X-Xn);                  %calculate error
end

plot(err);
title('Rank N Update');
xlabel('Rank');
ylabel('Error');