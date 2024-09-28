%% Метод поразрядного поиска

clc
clear

ep = 1e-4;
a = -2.5;
b = -1;
dx = (b-a)/4;
x0 = a;

xx = a:ep:b;
Fx = var_func(xx);
figure(2)
plot(xx, Fx)

func_cnt = 0;
iter_cnt = 0;

f0 = var_func(x0);
func_cnt = func_cnt + 1;

while true
    x1 = x0 + dx;
    f1 = var_func(x1);
    iter_cnt = iter_cnt + 1;
    func_cnt = func_cnt + 1;
    if f1 < f0
        x0 = x1;
        f0 = f1;
    else
        if abs(dx) <= ep
            x_min = x0;
            F_min = f0;
            break
        else
            dx = (-1) * dx/4;
            x0 = x1;
            f0 = f1;
        end
    end
end

x_min
F_min
iter_cnt
func_cnt