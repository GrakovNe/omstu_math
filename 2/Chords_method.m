A = 2.0;
B = 5;
E = 0.0001;

syms x;
y = -0.564 - 4.394 * x - 3.407 * x.^2 + x.^3;

y1 = diff(y);
y2 = diff(y1);

FA = subs(y, A);
fprintf(1, 'f(A) = %s\n', char(vpa(FA)) );
FB = subs(y, B);
fprintf(1, 'f(B) = %s\n', char(vpa(FB)) );

fprintf(1, '%s - производная положительна на [3; 5]\n', char(vpa(y2)) );

Old_A = B;

while (abs(Old_A - A) > E)
    Old_A = A;
    A = A - subs(y, A) / (subs(y, A) - subs (y, B)) * (A - B);
end;

Ans = vpa (A);
FX  = vpa (subs(y, A));

fprintf (1, 'X = %f; f(X) = %f', eval(Ans), eval(FX));

x = (Ans - 1): (Ans + 1);
y = subs(y);

hold on;
grid on;
plot (x, y);








