function [mu, s2] = estimations(X)
fprintf("в) вычисление оценок mu и s2 математического ожидания MX и дисперсии DX\n");
n = length(X);
mu = sum(X) / n;
s2 = sum((X - mu).^2) / (n - 1);
fprintf("mu = %f\n", mu);
fprintf("s2 = %f\n", s2);
end

