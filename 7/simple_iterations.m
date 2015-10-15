syms x1 x2 x3 x4;
X1 = 3.14210 / 8.52378 * x2 + 0.18710 / 8.52378 * x3 - 1.15700 / 8.52378 * x4 + 16.18665 / 8.52378;
X2 = 0.02713 / 5.34326 * x1 - 2.17110 / 5.34326 * x3 - 0.47340 / 5.34326 * x4 - 14.18018 / 5.34326;
X3 = - 0.80130 / 9.60540 * x1 + 2.711130 / 9.60540 * x2 - 1.06140 / 9.60540 * x4 + 6.616237 / 9.60540;
X4 = 0.02713 / 14.66234 * x1 + 8.00900 / 14.66234 * x2 - 1.83880 / 14.66234 * x3 + 10.15728 / 14.66234;

old_x0 = [(16.18665 / 8.52378) (-14.18018 / 5.34326) (6.616237 / 9.60540) (10.15728 / 14.66231)];
new_x0 = [0 0 0 0];

E = 0.0001;

while abs((max(old_x0) - max(new_x0))) > E
    old_x0 = new_x0;
    new_x0(1) = subs(X1, [x2 x3 x4], [old_x0(2) old_x0(3) old_x0(4)]);
    new_x0(2) = subs(X2, [x1 x3 x4], [old_x0(1) old_x0(3) old_x0(3)]);
    new_x0(3) = subs(X3, [x1 x2 x4], [old_x0(1) old_x0(2) old_x0(4)]);
    new_x0(4) = subs(X4, [x1 x2 x3], [old_x0(1) old_x0(2) old_x0(3)]);
end

fprintf(1, 'x1 = %f\nx2 =  %f\nx3 = %f\nx4 = %f\n', new_x0(1), new_x0(2), new_x0(3), new_x0(4));

