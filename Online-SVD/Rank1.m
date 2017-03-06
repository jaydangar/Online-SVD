function [Un,Sn,Vn] = Rank1(U, S, V, a, b)

    VaD = [V' zeros(size(V',1),1)];
    V = VaD';  

    m = U'*a;
    p = a - U*m;
    Ra = norm(p);
    P = inv(Ra)*p;

    n = V'*b;
    q = b - V*n;
    Rb = norm(q);
    Q = inv(Rb)*q;

    K=[S m;zeros(size(Ra, 1), size(S, 2)) Ra];

    [UDn, SDn, VDn] = svd(K);

    Up = [U P];
    Vq = [V Q];

    Un = Up*UDn;    
    Vn = Vq*VDn;    
    Sn = SDn;       

end