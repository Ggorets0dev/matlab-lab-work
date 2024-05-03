clear
clc

% I Интерполяция функции Рунге (n = 11, -1 <= x <= 1)

% Равноотстоящие узлы
a = -1;
b = 1;
n = 11;
h = (b - a) / (n - 1); % шаг

% --- для графика
X = a:0.01:b;
Y_r = f_runge(X);
N_X = length(X);
% ---

x = a:h:b; % узлы
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

R = L - Y_r; % погрешность
figure(1)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% Чебышевские узлы
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

R = L - Y_r; % погрешность
figure(2)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% -------------------

% II Интерполяция по варианту 

% n = 11, формула Лагранжа
a = 0;
b = 4;
n = 11;
h = (b - a) / (n - 1); % шаг

% --- для графика
X = a:0.01:b;
Y_r = f_var(X);
N_X = length(X);
% ---

x = a:h:b; % узлы
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
R = L - Y_r; % погрешность
figure(3)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% n = 11, средства MATLAB
k = polyfit(x, y, n - 1); % коэф.
L_m = polyval(k, X);
R = L_m - Y_r; % погрешность
figure(4)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% n = 6, формула Лагранжа
a = 0;
b = 4;
n = 6;
h = (b - a) / (n - 1); % шаг

% --- для графика
X = a:0.01:b;
Y_r = f_var(X);
N_X = length(X);
% ---

x = a:h:b; % узлы
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
R = L - Y_r; % погрешность
figure(5)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')

% n = 6, средства MATLAB
k = polyfit(x, y, n - 1); % коэф.
L_m = polyval(k, X);
R = L_m - Y_r; % погрешность
figure(6)
plot(X, Y_r, 'g', X, L, 'b', X, R, 'r', x, y, '*m')