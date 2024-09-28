clc
clear

% Решение задачи Коши
a = 2;
b = 2.5;
h = 0.01;

X = a:h:b;

y2 = 1;

% I Явный метод Эйлера
explicit_eulor_method(h, X, y2);

% II Метод Рунге-Кутта
runge_kutta_method(h, X, y2);

% III Встроенные средства MATLAB
internal_method(a, b, y2);