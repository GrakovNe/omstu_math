syms x y z

f1 = sqrt(x) + sqrt(y) + sqrt(z) - 4;
f2 = x + y + z - 6;
f3 = x^2 + y^2 + z^2 - 18;

x0 = [1; 1; 1];

W = [diff(f1, x) diff(f1, y) diff(f1, z); diff(f2, x) diff(f2, y) diff(f2, z); diff(f3, x) diff(f3, y) diff(f3, z)];
TranspW = transpose(W);

oldX0 = [0;0;0];
E = 0.0001;

while (abs(max(oldX0) - max(x0)) > E)
    oldX0 = x0;
    wX = vpa(subs(W, [x y z], [x0(1) x0(2) x0(3)]));
    wtX= vpa(subs(TranspW, [x y z], [x0(1) x0(2) x0(3)]));
    fX = [subs(f1, [x y z], [x0(1) x0(2) x0(3)]); subs(f2, [x y z], [x0(1) x0(2) x0(3)]); subs(f2, [x y z], [x0(1) x0(2) x0(3)])];
    uX = (sum(fX.*(wX*wtX*fX))) / sum((wX*wtX*fX).*(wX*wtX*fX));
    
    x0 = x0 - uX*wtX*fX;
end

disp(x0);




