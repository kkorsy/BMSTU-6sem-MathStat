function lab_1()
X = csvread('X.csv');
% a)
[Mmax, Mmin] = MinMax(X);
% á)
R = range(Mmax, Mmin);
% â)
[mu, s2] = estimations(X);
% ã)
interval_row = grouping(X);
% ä)
graph1(X, length(interval_row), mu, s2);
% å)
graph2(X, mu, s2);
end