syms x y

dY = exp(x) * (x + 1) + y / (x+1) ;
Y = int(dY);

Res = 0;
H = 0.01;
X = 0:H:0.5;

for i = 0.01:H:0.5
    Res = [Res, vpa(Res(end) + H * subs(Y, [x y], [i, Res(end)]))];
end
plot(X, Res);




