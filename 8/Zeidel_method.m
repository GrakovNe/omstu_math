 syms x1 x2 x3 x4;

X1 = - 0.3 * x2 - 0.4 * x3 - 0.2 * x4 - 1;
X2 = - 0.1 * x1 + 0.14 * x3 - 0.14 * x4 - 1;
X3 = - 0.1 * x1 - 0.1 * x2 - 0.3 * x4 + 2;
X4 = - 0.3 * x1 + 0.4 * x2 + 0.2 * x3 - 0.1;

old_x0 = [-1 -1 2 0.1];

new_x0 = [0 0 0 0];

E = 0.0001;

while abs((max(old_x0) - max(new_x0))) > E
    old_x0 = new_x0;
    new_x0(1) = subs(X1, [x2 x3 x4], [new_x0(2) new_x0(3) new_x0(4)]);
    new_x0(2) = subs(X2, [x1 x3 x4], [new_x0(1) new_x0(3) new_x0(3)]);
    new_x0(3) = subs(X3, [x1 x2 x4], [new_x0(1) new_x0(2) new_x0(4)]);
    new_x0(4) = subs(X4, [x1 x2 x3], [new_x0(1) new_x0(2) new_x0(3)]);
end

fprintf(1, 'x1 = %f\nx2 =  %f\nx3 = %f\nx4 = %f\n', new_x0(1), new_x0(2), new_x0(3), new_x0(4));

