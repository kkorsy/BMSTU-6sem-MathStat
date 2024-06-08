function interval_row = grouping(X)
fprintf("г) Группировка значений выборки в m = [log2 n] + 2 интервала\n");
n = length(X);
m = floor(log2(n)) + 2;
fprintf("Количество интервалов m = %d\n", m);
X_sorted = sort(X);
delta = (X_sorted(n) - X_sorted(1)) / m;

interval_row = zeros(m, 1);
for i = 1 : m
    cnt = 0;
    for x = X
        if ((x >= X_sorted(1) + (i - 1) * delta) && (x < X_sorted(1) + i * delta)) || ((i == m) && (x >= X_sorted(1) + (m - 1) * delta) && (x <= X_sorted(n)))
            cnt = cnt + 1;
        end
    end
    
    if (i == m)
        fprintf(" %d. [%f; %f], кол-во элементов: %d\n", i, X_sorted(1) + (m - 1) * delta, X_sorted(n), cnt);
    else
        fprintf(" %d. [%f; %f), кол-во элементов: %d\n", i, X_sorted(1) + (i - 1) * delta, X_sorted(1) + i * delta, cnt);
    end
    
    interval_row(i) = cnt;
end
end

