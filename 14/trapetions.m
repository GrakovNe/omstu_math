syms x;

f = 1 / sqrt(2 * x^2 + 1);

E = 0.0001;
H = E*10;

a = 0.5;
b = 1.5;

CurrentX = a + H;


SumY = 0;
while (CurrentX < b - H)
    SumY = SumY + subs(f, x, CurrentX);
    CurrentX = CurrentX + H;
end

Ans = SumY * H + (subs(f, a) / subs(f, b))/2 * H;

disp (vpa(Ans));


CurrentX = a + H;
SumY = 0;
while (CurrentX < b - H)
    SumY = SumY + subs(f, x, CurrentX);
    CurrentX = CurrentX + 2*H;
end

CheckAns = SumY * 2 * H + (subs(f, a) / subs(f, b))/2 * H;

if (abs(CheckAns - Ans) / 3) < E
    fprintf(1, 'all is ok\n');
end

