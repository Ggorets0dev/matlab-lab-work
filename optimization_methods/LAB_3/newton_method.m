clc;

%% Метод Ньютона

x = [0; 0]; 

G_matr = [90 -88; -88 90]; % Матрица Гессе (вычисляется вручную)

% Счетчики
func_cnt = 0;
iter_cnt = 0;
grad_cnt = 0;

grad = grad_f(x);
grad_cnt = grad_cnt + 1;
 
while norm(grad) > eps
    x = x - G_matr \ grad;
    grad = grad_f(x);
    
    grad_cnt = grad_cnt + 1;
    iter_cnt = iter_cnt + 1;
end

% Вывод результатов
disp('Минимум найден:');
disp(['x1 = ', num2str(x(1))]);
disp(['x2 = ', num2str(x(2))]);
disp(['f(x) = ', num2str(var_func(x))]);
disp('------------');
disp(['Количество вычислений функции = ', num2str(func_cnt)]);
disp(['Количество вычислений градиента = ', num2str(grad_cnt)]);
disp(['Количество итераций = ', num2str(iter_cnt)]);
