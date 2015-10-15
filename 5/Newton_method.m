A = 0.5;
B = 1;
E = 0.0001;

syms x;
y = x - sin(2*x);

y1 = diff(y);
y2 = diff(y1);


FA = subs(y, A);
fprintf(1, 'f(A) = %s\n', char(vpa(FA)) );

FB = subs(y, B);
fprintf(1, 'f(B) = %s\n', char(vpa(FB)) );

fprintf (1, 'Вторая производная %s - положительна на отрезке [0.5;1]\nТочка A - неподвижный конец\n', char(y2));


OldB = A;

while (abs(OldB - B) > E)
    OldB = B;
    B = B - (subs(y, B) / subs(y1, B) );
end;

Ans = vpa(B, 5);
FX = subs(y, B);

fprintf(1, 'X = %s, f(x) = %s', char(Ans), eval(FX) );

hold on;
grid on;

x = (Ans - 1): (Ans + 1);
y = subs (y);

plot (x, y);

