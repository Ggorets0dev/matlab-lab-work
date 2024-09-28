%% Метод золотого сечения 
 
clear
clc

a = -2.5;
b = -1;
ep = 0.0001;
d = 0.1*ep;

iter_cnt = 0; 
func_cnt = 0;

xx = a:ep:b;
Fx = var_func(xx);
figure(4)
plot(xx,Fx)

fa = var_func(a);
fb = var_func(b);
func_cnt = func_cnt + 2;

t = (sqrt(5)-1)/2
while (b-a) / 2 > ep
    x2=a+t*(b-a);
    f2=var_func(x2);
    x1=a+b-x2;
    f1=var_func(x1);
    func_cnt = func_cnt + 2;
if  f1<=f2
    b=x2;
    x2=x1;
    f2=f1;
    x1=a+b-x1;
    
    f1=var_func(x1);
    func_cnt = func_cnt + 1;
else
    a=x1;
    f2=f1;
    x2=a+b-x2;
    
    f2 = var_func(x2); 
    func_cnt = func_cnt + 1;
end
    iter_cnt = iter_cnt + 1;
end
x_min = (a+b)/2
F_min = var_func(x_min)
iter_cnt
func_cnt
