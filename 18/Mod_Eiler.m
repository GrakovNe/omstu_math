syms x y;

dY = x + cos(y / 2.7182818);
Y = int(dY);

H = 0.1;
X = 1.4:H:2.2;
Res = 2.2;

for i = 1.5:H:2.2
    Res = [Res, vpa(Res(end) + H * subs(Y, [x y], [(i + H/2), Res(end) * H/2] ))];
end
plot(X, Res);

