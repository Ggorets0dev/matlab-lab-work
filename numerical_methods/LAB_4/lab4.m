clear
clc

% I ������������ ������� ����� (n = 11, -1 <= x <= 1)

% �������������� ����
a = -1;
b = 1;
n = 11;
h = (b - a) / (n - 1); % ���

% --- ��� �������
X = a:0.01:b;
Y_r = f_runge(X);
N_X = length(X);
% ---

x = a:h:b; % ����
y = f_runge(x);

L = zeros(1, N_X);
for i1 = 1:n
    l = ones(1, N_X);
    for j1 = 1:n
        if (j1 ~= i1)
            l = l .* (X-x(j1)) / (x(i1) - x(j1));
        end
    end
    L = L + y(i1)*l;
end

R = L - Y_r; % �����������
figure(1)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% ����������� ����
x = zeros(1, n);
for i1 = 1:n
    x(i1) = cos((2*(i1-1)+1)*pi / (2*n));
end
y = f_runge(x);

L = zeros(1, N_X);
for i1 = 1:n
    l = ones(1, N_X);
    for j1 = 1:n
        if (j1 ~= i1)
            l = l .* (X-x(j1)) / (x(i1) - x(j1));
        end
    end
    L = L + y(i1)*l;
end

R = L - Y_r; % �����������
figure(2)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% -------------------

% II ������������ �� �������� 

% n = 11, ������� ��������
a = 0;
b = 4;
n = 11;
h = (b - a) / (n - 1); % ���

% --- ��� �������
X = a:0.01:b;
Y_r = f_var(X);
N_X = length(X);
% ---

x = a:h:b; % ����
y = f_var(x);

L = zeros(1, N_X);
for i1 = 1:n
    l = ones(1, N_X);
    for j1 = 1:n
        if (j1 ~= i1)
            l = l .* (X-x(j1)) / (x(i1) - x(j1));
        end
    end
    L = L + y(i1)*l;
end
R = L - Y_r; % �����������
figure(3)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% n = 11, �������� MATLAB
k = polyfit(x, y, n - 1); % ����.
L_m = polyval(k, X);
R = L_m - Y_r; % �����������
figure(4)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% n = 6, ������� ��������
a = 0;
b = 4;
n = 6;
h = (b - a) / (n - 1); % ���

% --- ��� �������
X = a:0.01:b;
Y_r = f_var(X);
N_X = length(X);
% ---

x = a:h:b; % ����
y = f_var(x);

L = zeros(1, N_X);
for i1 = 1:n
    l = ones(1, N_X);
    for j1 = 1:n
        if (j1 ~= i1)
            l = l .* (X-x(j1)) / (x(i1) - x(j1));
        end
    end
    L = L + y(i1)*l;
end
R = L - Y_r; % �����������
figure(5)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% n = 6, �������� MATLAB
k = polyfit(x, y, n - 1); % ����.
L_m = polyval(k, X);
R = L_m - Y_r; % �����������
figure(6)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')