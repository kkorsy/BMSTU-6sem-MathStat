function [Mmax, Mmin] = MinMax(X)
fprintf("a) Вычисление максимального значения Mmax и минимального значения Mmin\n");
Mmax = max(X);
Mmin = min(X);
fprintf("Mmax = %f\n", Mmax);
fprintf("Mmin = %f\n", Mmin);
end
