function lab_2()
    X = csvread('X.csv');
    n = length(X);
    for i = 1 : n
       fprintf("%f\n", X(i)); 
    end
    % 1. а) вычисление точечных оценок мат. ож. и дисперсии
    mu = sum(X) / n;
    fprintf("mu = %f\n", mu);
    if (n > 1)
        s2 = sum((X - mu) .^2) / (n - 1);
    else
        s2 = 0;
    end
    fprintf("s2 = %f\n", s2);
    % б) вычисление нижней и верхней границ дов. интервала для мат. ож.
    gamma = 0.9;
    alpha = (1 + gamma) / 2;
    
    q_st = tinv(alpha, (n - 1));
    mu_down = mu - (sqrt(s2) * q_st) / sqrt(n);
    mu_up = mu + (sqrt(s2) * q_st) / sqrt(n);
    fprintf("mu_down = %f\n", mu_down);
    fprintf("mu_up = %f\n", mu_up);
    fprintf("Interval: (%f; %f)\n", mu_down, mu_up);
    
    % в) вычисление нижней и верхней границ дов. интервала для дисперсии
    q_hi_down = chi2inv(alpha, (n - 1));
    q_hi_up = chi2inv((1 - alpha), (n - 1));
    s2_down = (n - 1) * s2 / q_hi_down;
    s2_up = (n - 1) * s2 / q_hi_up;
    fprintf("s2_down = %f\n", s2_down);
    fprintf("s2_up = %f\n", s2_up);
    fprintf("Interval: (%f; %f)\n", s2_down, s2_up);
    
    % 3. а) график для мат. ож.
    mu_xN = zeros(n, 1);
    mu_xn = zeros(n, 1);
    mu_xn_down = zeros(n, 1);
    mu_xn_up = zeros(n, 1);
    
    for i = 1 : n
        mu_xN(i) = sum(X) / n;
        mu_xn(i) = sum(X(1 : i)) / i;
        
        q_st_i = tinv(alpha, (i - 1));
        if (i > 1)
            s2_i = sum((X(1 : i) - mu_xn(i)) .^2) / (i - 1);
        else
            s2_i = 0;
        end
        mu_xn_down(i) = mu_xn(i) - (sqrt(s2_i) * q_st_i) / sqrt(i);
        mu_xn_up(i) = mu_xn(i) + (sqrt(s2_i) * q_st_i) / sqrt(i);
    end
    plot((10 : n), mu_xN(10 : n));
    hold on;
    plot((10 : n), mu_xn(10 : n));
    hold on;
    plot((10 : n), mu_xn_down(10 : n));
    hold on;
    plot((10 : n), mu_xn_up(10 : n));
    hold on;
    
    grid on;
    xlabel("n");
    ylabel('\mu');

    legend('\mu(xN)', '\mu(xn)', '\mu\_down(xn)', '\mu\_up(xn)');
        
    % б) график для дисперсии
    figure();
    s2_xN = zeros(n, 1);
    s2_xn = zeros(n, 1);
    s2_xn_down = zeros(n, 1);
    s2_xn_up = zeros(n, 1);
    
    for i = 1 : n
        s2_xN(i) = sum((X - mu_xn(n)) .^2) / (n - 1);
        if (i > 1)
            s2_xn(i) = sum((X(1 : i) - mu_xn(i)) .^2) / (i - 1);
        else
            s2_xn(i) = 0;
        end
        q_hi_down_i = chi2inv(alpha, (i - 1));
        q_hi_up_i = chi2inv((1 - alpha), (i - 1));
        s2_xn_down(i) = (i - 1) * s2_xn(i) / q_hi_down_i;
        s2_xn_up(i) = (i - 1) * s2_xn(i) / q_hi_up_i;
    end
    plot((10 : n), s2_xN(10 : n));
    hold on;
    plot((10 : n), s2_xn(10 : n));
    hold on;
    plot((10 : n), s2_xn_down(10 : n));
    hold on;
    plot((10 : n), s2_xn_up(10 : n));
    hold on;
    
    grid on;
    xlabel("n");
    ylabel('\sigma');

    legend('S^2(xN)', 'S^2(xn)', '\sigma^2\_down(xn)', '\sigma^2\_up(xn)');
end

