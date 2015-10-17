syms x y
Y = 0.8 - cos(x + 0.5);
X = (1.6 - sin(y)) / 2;

X0 = [100.5 1.5];
old_X0 = [0 0];

E = 0.0000001;

while (abs(max(old_X0) - max(X0)) > E)
    old_X0 = X0;
    X0(1) = vpa(subs(Y, x, X0(1)));
    X0(2) = vpa(subs(X, y, X0(2)));
end

disp (X0);