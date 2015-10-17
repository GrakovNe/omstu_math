syms x;

f = 1 / (1 - 0.49 * (sin(x))^2);

a = 0;
b = 1.6;

E = 0.0001;
H = 0.0025;

f0 = subs(f, a);
fn = subs(f, b);

x0 = a+H;
OddSum = 0;
while (x0 < b)
    OddSum = OddSum + subs(f, x, x0);
    x0 = x0 + 2*H;
end

x0 = a+2*H;
EvenSum = 0;
while (x0 < b)
    EvenSum = EvenSum + subs(f, x, x0);
    x0 = x0 + 2*H;
end

Ans = H/3 * (f0 + fn + 4 * OddSum + 2 * EvenSum);

x0 = a+H;
OddSum = 0;
while (x0 < b)
    OddSum = OddSum + subs(f, x, x0);
    x0 = x0 + 4*H;
end

x0 = a+2*H;
EvenSum = 0;
while (x0 < b)
    EvenSum = EvenSum + subs(f, x, x0);
    x0 = x0 + 4*H;
end

CheckAns = H/3 * (f0 + fn + 4 * OddSum + 2 * EvenSum) * 2;

disp (vpa(Ans));

if (abs(CheckAns - Ans) / 3) < E
    fprintf(1, 'all is ok\n');
end






