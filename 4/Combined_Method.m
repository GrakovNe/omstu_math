syms x;

A = -10;
B = -0.5;
E = 0.0001;

y = x - cot(x);

y1 = diff(y);
y2 = diff(y1);

FA = subs(y, A);
fprintf(1, 'f (A) = %f\n', eval(FA));

FB = subs(y, B);
fprintf(1, 'f (B) = %f\n', eval(FB));

fprintf(1, '%s - производная на отрезке [-10; -1] положительна\n', char(y2));

while (abs(A - B) > E)
    A = A - subs(y, A) / (subs(y, A) - subs (y, B)) * (A - B);
    B = B - (subs(y, B) / subs(y1, B) );
end;

Ans = (A + B) / 2;
disp (vpa(Ans,5));
