clc;
clear;

% Точность вычислений
eps = 1e-3;

% Матрица Гессе (вычисляется вручную)
G_matr = [90 -88; -88 90];

% Определяем функцию
var_func = @(x) 45 * (x(1) .^ 2) - 88 .* x(1) .* x(2) + 45 .* (x(2) .^ 2) + 102 .* x(1) + 268 .* x(2) - 21;

% Определяем градиент функции
grad_f = @(x) [
    90 * x(1) - 88 * x(2) + 102;
    -88 * x(1) + 90 * x(2) + 268;
];