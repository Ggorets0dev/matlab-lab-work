clc;
clear;

%% Метод хорд

func_cnt = 0;
iter_cnt = 0;

a = -2.5;
b = -1.0;
eps = 0.0001;

% Построение графика
x = a:eps:b;
Fx = var_func(x);
figure(2);
plot(x, Fx)

% Выполнение методом хорд
dfa = var_func_d(a);
dfb = var_func_d(b);
func_cnt = func_cnt + 2;

x0 = a - dfa * (a - b) / (dfa - dfb);
fx = var_func_d(x0);
func_cnt = func_cnt + 1;

% Построение хорд до точки приемлемой точности
while abs(fx) > eps
    if fx > 0
        b = x0;
    else
        a = x0;
    end
    
    x0 = a - (dfa / (dfa - dfb)) * (a - b);
    fx = var_func_d(x0);
    
    iter_cnt = iter_cnt + 1;
    func_cnt = func_cnt + 1;
end

disp('Вычисления:')
x_min = x0
f_min = var_func(x_min)

disp('Подсчеты использования:')
func_cnt
iter_cnt