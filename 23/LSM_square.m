syms a b c x;

X = [1.07 1.91 2.29 2.68 3.17 3.34 3.90 4.85 4.92 8.35 9.10 9.22 9.43];
Y = [-4.19 -4.41 -4.34 -4.44 -4.86 -4.79 -5.08 -6.35 -5.93 -7.38 -8.51 -8.67 -8.67];

SumX = sum(X);
SumY = sum(Y);

SumX2 = 0;
for i=1:13
    SumX2 = SumX2 + X(i)^2;
end

SumXY = 0;
for i=1:13
    SumXY = SumXY + X(i)*Y(i);
end

SumX3 = 0;
for i=1:13
    SumX3 = SumX3 + X(i)^3;
end

SumX4 = 0;
for i=1:13
    SumX4 = SumX4 + X(i)^4;
end

SumX2Y = 0;
for i=1:13
    SumX2Y = SumX2Y + (X(i)^2)*Y(i);
end

F = a * SumX4 + b * SumX3 + c * SumX2 - SumX2Y;
S = a * SumX3 + b * SumX2 + c * SumX - SumXY;
T = a * SumX2 + b * SumX  + 13 * c - SumY;

Ans = solve(F, S, T);
x = 1.07:0.1:9.43;
y = Ans.a * x.^2 + Ans.b * x + Ans.c;

hold on;
grid on;
plot(X, Y, 'k.');
plot(x, y, 'r');
