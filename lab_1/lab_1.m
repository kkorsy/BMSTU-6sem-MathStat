function lab_1()
X = csvread('X.csv');
% a)
[Mmax, Mmin] = MinMax(X);
% �)
R = range(Mmax, Mmin);
% �)
[mu, s2] = estimations(X);
% �)
interval_row = grouping(X);
% �)
graph1(X, length(interval_row), mu, s2);
% �)
graph2(X, mu, s2);
end