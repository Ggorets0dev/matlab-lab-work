%% Метод деления отрезка пополам (дихотомии, бисекциий)

clear
clc

a = -2.5;
b = -1;
e = 0.0001;
d = 0.1 * e;

iter_cnt = 0; 
func_cnt = 0;

xx = a:e:b;

Fx = var_func(xx);

figure(3)
plot(xx,Fx)

fa = var_func(a);
fb = var_func(b);
func_cnt = func_cnt + 2;

while  (b-a)/2>e
    x1 = (b+a-d)/2;
    f1 = var_func(x1);
    func_cnt = func_cnt + 1;

    x2 = (b+a+d)/2;
    f2 = var_func(x2);
    func_cnt = func_cnt + 1;

    if f1<=f2
       b=x2;
    else
       a=x1;
    end
       iter_cnt = iter_cnt + 1;
end
x_min = (a+b)/2
F_min = var_func(x_min)
iter_cnt
func_cnt
