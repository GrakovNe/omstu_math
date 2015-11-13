syms k b x;

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

F = k * SumX2 + b * SumX - SumXY;
S = k * SumX + 13 * b - SumY;

Ans = solve(F,S);

hold on;
grid on;
plot(X, Y, 'k.');

x = 1.07:0.1:9.43;
y = Ans.k * x + Ans.b;
plot(x, y, 'r');

