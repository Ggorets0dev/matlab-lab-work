%% Метод перебора

clear
clc

a = -2.5;
b = -1;
e = 0.0001;
N = (b - a) / e;
h = e;

func_cnt = 0;
iter_cnt = 0;

xx = a:h:b;

Fx = var_func(xx);

figure(1)
plot(xx, Fx)

x_min = a;

F_min = var_func(x_min);
func_cnt = func_cnt + 1;

for i = 1 : N + 1
    f = var_func(xx(i));
    func_cnt = func_cnt + 1;
    
    if f <= F_min
        x_min = (xx(i));
        
        F_min = f;
    end
    iter_cnt = iter_cnt + 1;
end

x_min
F_min
iter_cnt
func_cnt
