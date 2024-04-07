clc
clear

% Задание 1
x = 0.1:0.01:4;
y = f_lab2(x);

figure(1)
plot(x,y)

% Метод Дихотомии
a = 1;
b = 2;
n = 15;
Fa = f_lab2(a);
Fb = f_lab2(b);

for i1=1:n
    c = (a + b) / 2;
    Fc = f_lab2(c);
    if Fa * Fc < 0
        b = c;
        Fb = Fc;
    else
        a = c;
        Fa = Fc;
    end
end

x_d = (a + b) / 2 % Корень метода Дихотомии
nev_d = f_lab2(x_d) % Невязка

% По функции fzero
x_z = fzero('sin(sin(x.^2)) - 0.5', [1 2])
pogr_d = x_d - x_z

% Метод Ньютона
a = 1;
b = 2;
x0 = 1.7;

for i1=1:n
    x0 = x0 - f_lab2(x0) / df_lab2(x0);
end

x_n = x0
nev_n = f_lab2(x_n)
pogr_n = x_n - x_z