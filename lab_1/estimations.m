function [mu, s2] = estimations(X)
fprintf("�) ���������� ������ mu � s2 ��������������� �������� MX � ��������� DX\n");
n = length(X);
mu = sum(X) / n;
s2 = sum((X - mu).^2) / (n - 1);
fprintf("mu = %f\n", mu);
fprintf("s2 = %f\n", s2);
end

