function graph1(X, m, mu, s2)
fprintf("�) ���������� ����������� � ������� ������� ��������� ������������� ������������ ���������� ��������� �������� � �������������� ��������� mu � ���������� s2\n");
figure();
h = histogram(X, m, 'Normalization', 'pdf');
delta = (max(X) - min(X)) / m;
h.BinEdges = min(X):delta:max(X);
hold on;

xlist = min(X):.5:max(X);
ylist = pdf('Normal', xlist, mu, s2);
plot(xlist, ylist);
hold off;
end

