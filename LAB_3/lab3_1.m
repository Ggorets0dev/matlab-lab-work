clear
clc

% Создание матрицы и вектора-столбца
n1 = 31;
n2 = 7; % Вариант 7
n = n1 + n2;

rand('seed', n);
A = rand(7);

b = 10*rand(7,1);

Au = triu(A);
Al = tril(A);
Ad = diag(diag(A));

su = sum(sum(abs(Au)));
sl = sum(sum(abs(Al)));
Su = sum(abs(Au));
Sl = sum(abs(Al));

sigma = 5;
O = ones(7);
Ou = triu(O);

S6 = diag(sigma * (Su ./ Sl));
At = sigma * ((Al+Ou) ./ (Au' + Ou));
neo = rem(n2, 2);
mode = rem(n2, 3);
if (mode == 0) 
    Al = (sigma * su / sl) * Al; 
end
if (mode == 1) 
    Al = S6 * Al; 
end
if (mode == 2) 
    Al = At.*Al;
end
A = Al + Ad + Au;
ma = max(max(abs(A)));
if (ma > 1000) 
    A = 0.08 * A; 
end

A = 0.5 * A + 2.75 * diag(diag(A))
b
n = 7;
 
% Исправление матрицы для обеспечения диагонального преобладания
for i1 = 1:n
    s = 0;
    for j1 = 1:n
        s = s + abs(A(i1,j1));
    end
    A(i1,i1) = s;
end
 
A

% I Метод простых итераций
% Переход к виду x = Bx + g
 
D = diag(diag(A));
D_inv = D ^ -1;
T = A - D;
B = -D_inv * T
g = D_inv * b
 
% Начальное приближение и задание числа итераций
x0 = zeros(7,1);
N_iter = 20;
 
X = x0; % Для последующего формирования графика
 
% Итерационный процесс
for i1 = 1:N_iter
    x1 = B * x0 + g;
    X = [X x1];
    x0 = x1;
end
 
% Подсчёт невязки
x_pr = x1
nev_pr = A*x_pr - b
 
x_t = A\b  % Решение уравнения
pogr = x_pr - x_t % Погрешность решения
 
 
% График соходимости компонент решений
n_its = 0:N_iter;
figure (1)
plot(n_its, X)

% II Метод Зейделя
% x_k+1 = B_L*x_k+1 = B_U*x_k + g
% x_k+1 * (E - B_L) = B_U * x_k + g
% x_k+1 = (E - B_L)^-1 * [B_U*x_k + g]

% Реализация метода
B_L = tril(B);
B_U = triu(B);
E = eye(7,7);
F = (E - B_L) ^ -1;
G = F * B_U;
g1 = F * g;
x0 = zeros(7,1);
X = x0;
 
for i1 = 1:N_iter
    x1 = G * x0 + g1;
    X = [X x1];
    x0 = x1;
end
 
% Подсчёт погрешности и невязки для данного метода
x_z = x1
nev_z = A * x_z - b
pogr_z = x_z - x_t
 
% Построение графика для Метода Зейделя
n_its = 0:N_iter;
figure (2)
plot(n_its, X)

