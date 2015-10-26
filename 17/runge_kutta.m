syms x y

dY = exp(x) * (x + 1) + y / (x+1) ;
Y = int(dY);

Res = 0;
H = 0.01;
X = 0:H:0.5;

for i = 0.01:H:0.5
    K0 = subs(Y, [x y], [i Res(end)]);
    K1 = subs(Y, [x y], [(i+H/2) (Res(end)+K0/2)]);
    K2 = subs(Y, [x y], [(i+H/2) (Res(end)+K1/2)]);
    K3 = subs(Y, [x y], [(i+H) (Res(end)+K2)]);
    
    Res = [Res, vpa(Res(end) + H/6 * (K0 + 2* K1 + 2*K2 + K3))];
    
end
plot(X, Res);