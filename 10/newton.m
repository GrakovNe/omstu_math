syms x y;

E = 0.001;

f1 = x^2+2*y^2 - 1;
f2 = tan(x*y+0.1)-x^2;

W = [diff(f1, x) diff(f1, y); diff(f2, x) diff(f2, y)];
InvW = W^-1;

x0 = [0.3; 0.3];

old_X0 = [0; 0];
while (abs(max(old_X0) - max(x0)) > E)
    old_X0 = x0;
    wX = vpa(subs(W^-1, [x y], [x0(1) x0(2)]));
    fX = [subs(f1, [x y], [x0(1) x0(2)]); subs(f2, [x y], [x0(1) x0(2)])];
    x0 = x0 - wX * fX;
end

disp (vpa(x0));




