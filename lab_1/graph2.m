function graph2(X, mu, s2)
fprintf("�) ���������� ������� ������������ ������� ������������� � ������� ������������� ���������� ��������� �������� � �������������� ��������� mu � s2\n");
figure();
ecdf(X);
hold on;

xlist = min(X):.5:max(X);
ylist = cdf('Normal', xlist, mu, s2);
plot(xlist, ylist);
hold off;
end

