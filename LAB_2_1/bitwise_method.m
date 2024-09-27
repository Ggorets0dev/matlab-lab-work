%% Метод поразрядного поиска

clear
clc

a = -2.5;
b = -1;
e = 0.0001;

iter_cnt = 0;
func_cnt = 0;

x = a:0.1:b;

Fx = var_func(x);

figure(2)
plot(x,Fx)

d = (b - a) / 4;
x0 = a;

f0 = var_func(x0);
func_cnt = func_cnt + 1;

while abs(d) > e
    iter_cnt = iter_cnt + 1;
    x1 = x0 + d;
    
    f1 = var_func(x1);
    func_cnt = func_cnt + 1;

    if f0 >= f1
       x0 = x1;
       f0 = f1;
    end
    d = -d / 4;
end

x_min = x0
F_min = var_func(x_min)
iter_cnt
func_cnt
