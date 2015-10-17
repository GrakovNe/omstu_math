A = [0 0.3 0.4 0.2; 0.1 0 -0.14 0.14; 0.1 0.1 0 0.3; 0.3 -0.4 -0.2 0];
B = [-1; -2; 2; 0.1];
X0 = [0;0;0;0];

E = 0.001;

old_X0 = [5;5;5;5];

transpA = transpose(A);
while (abs(max(old_X0) - max(X0)) > E)
    old_X0 = X0;
    r = A * X0 - B;
    u = sum(r .* (A*transpA*r)) / (sum((A*transpA*r).*(A*transpA*r)));
    X0 = X0 - u*transpA*r;
end

disp (X0);