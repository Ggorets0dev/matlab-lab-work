clc; 
clear;

%% Метод средней точки

func_cnt = 0;
iter_cnt = 0;

a = -2.5;
b = -1.0;
eps = 0.0001;

% Построение графика
x = a:eps:b;
Fx = var_func(x);
figure(1);
plot(x, Fx)

% Выполнение методом средней точки
% Вычисление производной в средней точке
x0 = (a + b) / 2;
df_dx = var_func_d(x0);
func_cnt = func_cnt + 1;

% Поиск средней точки до приемлемой точности
while abs(df_dx) > eps
    if df_dx > 0
        b = x0;
    else
        a = x0;
    end
    
    x0 = (a + b) / 2;
    df_dx = var_func_d(x0);
    
    func_cnt = func_cnt + 1;
    iter_cnt = iter_cnt + 1;
end

disp('Вычисления:')
x_min = x0
f_min = var_func(x_min)

disp('Подсчеты использования:')
func_cnt
iter_cnt