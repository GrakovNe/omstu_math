syms x y

f1 = -5*x^2 - x*y + 64;
f2 = -2*x^2 + 3*y^2 - 16;

x0 = [1; 1];

W = [diff(f1, x) diff(f1, y); diff(f2, x) diff(f2, y)];
TranspW = transpose(W);

oldX0 = [0;0];
E = 0.00001;

while (abs(max(oldX0) - max(x0)) > E)
    oldX0 = x0;
    wX = vpa(subs(W, [x y], [x0(1) x0(2)]));
    wtX= vpa(subs(TranspW, [x y], [x0(1) x0(2)]));
    uX = (sum(fX.*(wX*wtX*fX))) / sum((wX*wtX*fX).*(wX*wtX*fX));
    fX = [subs(f1, [x y], [x0(1) x0(2)]); subs(f2, [x y], [x0(1) x0(2)])];

    x0 = x0 - uX*wtX*fX;
end

disp(x0);




