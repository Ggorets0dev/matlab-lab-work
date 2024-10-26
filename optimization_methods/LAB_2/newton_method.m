clc; 
clear;

%% Метод Ньютона

func_cnt = 0;
iter_cnt = 0;

a = -2.5;
b = -1.0;
eps = 0.0001;

% Построение графика
x = a:eps:b;
Fx = var_func(x);
figure(3);
plot(x, Fx)

% Выполнение методом Ньютона
% Выбор начального приближения
x_0 = b;
x_k = (a + b) / 2;

% Вычисления до приемлемой точности
while abs(var_func_d(x_k)) > eps
    x_k = x_k - var_func_d(x_k) / var_func_d2(x_k);
    
    iter_cnt = iter_cnt + 1;
    func_cnt = func_cnt + 2;
end

% Учитываем расчет функции в условии цикла после выхода
func_cnt = func_cnt + 1;

disp('Вычисления:')
x_min = x_k
f_min = var_func(x_min)

disp('Подсчеты использования:')
func_cnt
iter_cnt