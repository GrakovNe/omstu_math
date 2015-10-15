A = -10;
B = -0.5;
E = 0.0001;
x0 = (A+B)/2;

E = 0.0001;

syms x;
y = x - cot(x);

y1 = diff(y);

FA = subs(y, A);
fprintf(1, 'f (A) = %f\n', eval(FA));

FB = subs(y, B);
fprintf(1, 'f (B) = %f\n', eval(FB));

phi = x - 1/subs(y1, x0) * y;
oldX0 = B;

while (abs(x0 - oldX0) > E)
    oldX0 = x0;
    x0 = subs(phi, x0);
end;

x0 = vpa(x0);
fprintf(1, 'x = %f\n', eval(x0));

